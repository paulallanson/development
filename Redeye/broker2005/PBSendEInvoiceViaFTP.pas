unit PBSendEInvoiceViaFTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, STPOObjects, STPODataMod, STSOObjects, STSODataMod,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TPBSendEInvoiceViaFTPFrm = class(TForm)
    Panel1: TPanel;
    Panel6: TPanel;
    edtUserName: TEdit;
    edtPassword: TEdit;
    Panel7: TPanel;
    Panel5: TPanel;
    lstbxStatus: TListBox;
    edtFTP: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    edtPONumber: TEdit;
    Label2: TLabel;
    edtSupplier: TEdit;
    Panel3: TPanel;
    btnSend: TBitBtn;
    btnCancel: TBitBtn;
    FTP: TIdFTP;
    lstbxFiles: TListBox;
    xmlDoc: TXMLDocument;
    btnClose: TBitBtn;
    procedure btnSendClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FTPStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure btnCloseClick(Sender: TObject);
  private
    FPurchaseOrder: TPurchaseOrder;
    FSTPODM: TSTPODM;
    procedure SetPurchaseOrder(const Value: TPurchaseOrder);
    procedure SetSTPODM(const Value: TSTPODM);
    procedure Log(Msg: String; Color: TColor);
    function ProcessAcknowledgement: Boolean;
    { Private declarations }
  public
    bSendPO: boolean;
    bSentOK: boolean;
    property PurchaseOrder : TPurchaseOrder read FPurchaseOrder write SetPurchaseOrder;
    property STPODM : TSTPODM read FSTPODM write SetSTPODM;
  end;

var
  PBSendEInvoiceViaFTPFrm: TPBSendEInvoiceViaFTPFrm;

implementation

uses PBDatabase, CCSCommon;

{$R *.dfm}

{ TPBSendPOViaFTPFrm }

procedure TPBSendEInvoiceViaFTPFrm.SetPurchaseOrder(const Value: TPurchaseOrder);
begin
  FPurchaseOrder := Value;
end;

procedure TPBSendEInvoiceViaFTPFrm.SetSTPODM(const Value: TSTPODM);
begin
  FSTPODM := Value;
end;

procedure TPBSendEInvoiceViaFTPFrm.btnSendClick(Sender: TObject);
var
  SalesOrder : TSalesOrder;
  STSalesOrdDM : TSTSalesOrdDM;
  tempstr, transferLoc: string;
  FileName, getFileName, AckPONumber, SupplierAckNo: string;
  icount, LineCount: integer;
  bSuccess: boolean;
  POLine, PONumber: string;
//  AckFile: TextFile;
begin
  STSalesOrdDM := TSTSalesOrdDM.Create(Self);
  SalesOrder := TSalesOrder.Create(STSalesOrdDM);

  lstbxStatus.Clear;

  try
    Salesorder.SONumber := PurchaseOrder.SalesOrder;
    STSalesOrdDM.LoadSOFromDatabase(SalesOrder);

    if bSendPO then
    begin
      lstbxStatus.Items.Add('Creating XML file for purchase order '+PurchaseOrder.PurchOrdNo);
      tempStr := PurchaseOrder.CreateXMLFile(STPODM, STSalesOrdDM, SalesOrder);
      if tempstr <> '' then
        begin
          lstbxStatus.Items.Add('Created XML file '+tempstr);
          PurchaseOrder.UpdateDBRecords(STPODM);
        end
      else
        begin
          lstbxStatus.Items.Add('Failed to create XML file!!!');
          exit;
        end;

//Connect and put the file
      lstbxStatus.Items.Add('Sending Purchase Order File');
      if FTP.Connected then
        begin
          FTP.Disconnect;
        end
      else
        begin
          FTP.Host := edtFTP.Text;
          FTP.Username := edtUserName.Text;
          FTP.Password := edtPassword.Text;

          FTP.Connect;

          FTP.ChangeDir('IN');

          transferLoc := dmBroker.GetCompanyTransferDirectory;
          Filename := transferLoc + '\Out\' + tempstr;

          FTP.Put(Filename, tempstr);

          sleep(7000);

          FTP.ChangeDir('DONE');

          lstbxFiles.clear;
          FTP.List(lstbxFiles.items, '', false);
          bSuccess := false;
          for icount := 0 to pred(lstbxFiles.items.count) do
            begin
              if trim(lstbxFiles.Items[icount]) = trim(tempstr) then
                begin
                  bSuccess := true;
                  if not DirectoryExists(transferLoc+'\Out\archive\') then
                    begin
                      try
                        CreateDir(transferLoc+'\Out\archive\');
                      except
                        exit
                      end;
                    end;

                  // move the file to archive or error directory
                  if FileExists(transferLoc+'\Out\archive\'+tempStr) then
                    DeleteFile(transferLoc+'\Out\archive\'+tempStr);

                  RenameFile(transferLoc+'\Out\'+tempStr,transferLoc+'\Out\archive\'+tempStr);

                  break;
                end;
            end;
          FTP.Disconnect;
          if not bSuccess then
            begin
              lstbxStatus.Items.Add('Sending FAILED !!!');
              PurchaseOrder.UpdateDBRecords(STPODM);
              exit;
            end;
      end;

      PurchaseOrder.SaveStatus(STPODM,'H');
    end;

//Connect and get the acknowledgment file
    lstbxStatus.Items.Add('Retrieving Acknowledgement File');
    if FTP.Connected then
      begin
        FTP.Disconnect;
      end
    else
      begin
        FTP.Host := edtFTP.Text;
        FTP.Username := edtUserName.Text;
        FTP.Password := edtPassword.Text;

        FTP.Connect;

        FTP.ChangeDir('OUT');
        FTP.ChangeDir('xs');

        lstbxFiles.clear;
        FTP.List(lstbxFiles.items, '', false);
        for icount := 0 to pred(lstbxFiles.items.count) do
          begin
            getFileName := lstbxFiles.Items[icount];

            Filename := dmBroker.GetCompanyTransferDirectory + '\Out\' + getFileName;

            FTP.Get(getFileName, FileName, false, FTP.ResumeSupported);

            FTP.Delete(getFileName);
          end;

        FTP.Disconnect;
    end;
  finally
    SalesOrder.Free;
    STSalesOrdDM.Free;
  end;

// Now process the acknowledgement files
  bSuccess := false;
  for icount := 0 to pred(lstbxFiles.Items.count) do
    begin
      getFileName := lstbxFiles.Items[icount];
      xmlDoc.active := false;
      xmlDoc.FileName := dmBroker.GetCompanyTransferDirectory + '\Out\' + getFileName;
      xmlDoc.active := true;

      AckPONumber := xmlDoc.DocumentElement.ChildNodes.Nodes['OrderResponseReferences'].ChildNodes.Nodes['BuyersOrderNumber'].Text;

      if PurchaseOrder.VersionNo = 0 then
        begin
          if trim(AckPONumber) <> trim(PurchaseOrder.PurchOrdNo) then
            continue;
        end
      else
        begin
          if trim(AckPONumber) <> trim(PurchaseOrder.PurchOrdNo+'/'+inttostr(PurchaseOrder.VersionNo)) then
            continue;
        end;
      bSuccess := true;

      PurchaseOrder.SupplierAckNo := xmlDoc.DocumentElement.ChildNodes.Nodes['OrderResponseReferences'].ChildNodes.Nodes['OrderResponseNumber'].Text;

      if ProcessAcknowledgement = true then
        PurchaseOrder.PurchOrdStatus := 'N'
      else
        PurchaseOrder.PurchOrdStatus := 'I';

      if not DirectoryExists(transferLoc+'\Out\xs\') then
        begin
          try
            CreateDir(transferLoc+'\Out\xs\');
          except
            exit
          end;
        end;

      // move the file to archive or error directory
      if FileExists(transferLoc+'\Out\xs\'+getfilename) then
        DeleteFile(transferLoc+'\Out\xs\'+getfilename);

      RenameFile(transferLoc+'\Out\'+getfilename,transferLoc+'\Out\xs\'+getfilename);
      break;
    end;

  if not bSuccess then
    begin
      lstbxStatus.Items.Add('Acknowledgement receipt FAILED !!!');
    end
  else
    begin
      btnSend.Visible := false;
      btnCancel.visible := false;
      btnClose.visible := true;
      bSentOK := true;
    end;

  PurchaseOrder.UpdateDBRecords(STPODM);
end;

function TPBSendEInvoiceViaFTPFrm.ProcessAcknowledgement: Boolean;
var
  RootNode, tmpNode, ChildNode : IXMLNode;
  sLine, sProduct, sQuantity, sPrice, sOrigPrice, sStatus, sPackSize, sOrigPackSize, sOrigLine, sDescription: string;
  sOrigQuantity: string;
  i, iNodes: integer;
  iLine, iQuantity, iPackSize, iOrigPackSize, iOrigQuantity, iOrigLine: integer;
  rPrice, rOrigPrice: real;
  POLine: TPurchaseOrderLine;
begin
  RootNode := XMLDoc.Node;
  for i:= 0 to pred(rootNode.ChildNodes.Count) do
    begin
      tmpNode := rootNode.ChildNodes.Nodes[i];
      if tmpNode.NodeName = 'OrderResponse' then
        begin
          for iNodes := 0 to pred(tmpNode.ChildNodes.count) do
            begin
              ChildNode := tmpNode.ChildNodes.Nodes[iNodes];
              if ChildNode.NodeName = 'OrderResponseLine' then
                begin
                sLine := ChildNode.ChildNodes.Nodes['LineNumber'].Text;
                iLine := strtoint(sLine);
                sStatus := ChildNode.ChildNodes.Nodes['Status'].Text;
                sProduct := ChildNode.ChildNodes.Nodes['Product'].ChildNodes.Nodes['SuppliersProductCode'].Text;
                sDescription := ChildNode.ChildNodes.Nodes['Product'].ChildNodes.Nodes['Description'].Text;
                sQuantity := ChildNode.ChildNodes.Nodes['Quantity'].ChildNodes.Nodes['Amount'].Text;
                if trim(sQuantity) = '' then
                  iQuantity := 0
                else
                  iQuantity := strtoint(sQuantity);

                sPackSize := ChildNode.ChildNodes.Nodes['Quantity'].ChildNodes.Nodes['Packsize'].Text;
                if trim(sPackSize) = '' then
                  iPackSize := 1
                else
                  iPackSize := strtoint(sPackSize);

                sPrice := ChildNode.ChildNodes.Nodes['Price'].ChildNodes.Nodes['UnitPrice'].Text;
                if trim(sPrice) = '' then
                  rPrice := 0.00
                else
                  rPrice := strtofloat(sPrice);

                sOrigQuantity := ChildNode.ChildNodes.Nodes['OriginalQuantity'].ChildNodes.Nodes['Amount'].Text;
                if trim(sOrigQuantity) = '' then
                  iOrigQuantity := 0
                else
                  iOrigQuantity := strtoint(sOrigQuantity);

                sOrigPackSize := ChildNode.ChildNodes.Nodes['OriginalQuantity'].ChildNodes.Nodes['Packsize'].Text;
                if trim(sOrigPackSize) = '' then
                  iOrigPackSize := 1
                else
                  iOrigPackSize := strtoint(sOrigPackSize);

                sOrigPrice := ChildNode.ChildNodes.Nodes['OriginalPrice'].ChildNodes.Nodes['UnitPrice'].Text;
                if trim(sOrigPrice) = '' then
                  rOrigPrice := 0.00
                else
                  rOrigPrice := strtofloat(sOrigPrice);

                sOrigLine := ChildNode.ChildNodes.Nodes['OriginalLineNumber'].Text;
                if trim(sOrigLine) = '' then
                  iOrigLine := 0
                else
                  iOrigLine := strtoint(sorigLine);

                if (trim(sStatus) = '') then
                  begin
                    if iOrigLine = 0 then
                      begin
                        PurchaseOrder.POLines[iLine-1].QuantityReceived := iQuantity*iPackSize;
                        PurchaseOrder.POLines[iLine-1].QuantitySent := iQuantity*iPackSize;
                        PurchaseOrder.POLines[iLine-1].PurchasePrice := rPrice;
                        PurchaseOrder.POLines[iLine-1].OrigPurchasePrice := rOrigPrice;
                        PurchaseOrder.POLines[iLine-1].OrigPurchPackQuantity := PurchaseOrder.POLines[iLine-1].PurchPackQuantity;
                        PurchaseOrder.POLines[iLine-1].PurchPackQuantity := iPackSize;
                        PurchaseOrder.POLines[iLine-1].CostPrice := rPrice;
                        PurchaseOrder.POLines[iLine-1].Modified := true;
                        PurchaseOrder.POLines[iLine-1].FullyReceived := 'Y';
                        PurchaseOrder.POLines[iLine-1].ProductStatus := trim(sStatus);
                      end
                    else
                      begin
                        sProduct := PurchaseOrder.AddPart(STPODM, sProduct, sDescription, iPackSize, rPrice);

                        PurchaseOrder.AddLine(sProduct,inttostr(iOrigLine),0,(iQuantity*iPackSize),iPackSize,rPrice);
                        PurchaseOrder.AddSOLine(STPODM, sProduct, inttostr(iOrigLine),0,(iQuantity*iPackSize),iPackSize,rPrice)
                      end;
                  end
                else
                if (trim(sStatus) = 'PDC') then
                  begin
                    if iOrigLine = 0 then
                      begin
                        PurchaseOrder.POLines[iLine-1].QuantityReceived := iQuantity*iPackSize;
                        PurchaseOrder.POLines[iLine-1].QuantitySent := iQuantity*iPackSize;
                        PurchaseOrder.POLines[iLine-1].PurchasePrice := rPrice;
                        PurchaseOrder.POLines[iLine-1].OrigPurchasePrice := rOrigPrice;
                        PurchaseOrder.POLines[iLine-1].OrigPurchPackQuantity := PurchaseOrder.POLines[iLine-1].PurchPackQuantity;
                        PurchaseOrder.POLines[iLine-1].PurchPackQuantity := iPackSize;
                        PurchaseOrder.POLines[iLine-1].CostPrice := rPrice;
                        PurchaseOrder.POLines[iLine-1].Modified := true;
                        PurchaseOrder.POLines[iLine-1].FullyReceived := 'Y';
                        PurchaseOrder.POLines[iLine-1].ProductStatus := trim(sStatus);
                      end
                    else
                      begin
                        sProduct := PurchaseOrder.AddPart(STPODM, sProduct, sDescription, iPackSize, rPrice);

                        PurchaseOrder.AddLine(sProduct,inttostr(iOrigLine),0,(iQuantity*iPackSize),iPackSize,rPrice);
                        PurchaseOrder.AddSOLine(STPODM, sProduct, inttostr(iOrigLine),0,(iQuantity*iPackSize),iPackSize,rPrice)
                      end;
                  end
                else
                if (trim(sStatus) = 'ODT') then
                  begin
                    lstbxStatus.Items.Add('Order FAILED!!! Illegal order/reserve dates');
                    result := false;
                    exit;
                  end
                else
                if (trim(sStatus) = 'MCC') then
                  begin
                    lstbxStatus.Items.Add('Order FAILED!!! No Contract code set for this customer');
                    result := false;
                    exit;
                  end
                else
                  begin
                    lstbxStatus.Items.Add('Order FAILED!!!');
                    result := false;
                    exit;
                  end;
                end;
            end;
        end;
    end;

  result := true;
end;

procedure TPBSendEInvoiceViaFTPFrm.FormActivate(Sender: TObject);
begin
  edtPONumber.Text := PurchaseOrder.PurchOrdNo;
  edtSupplier.Text := PurchaseOrder.SupplierName(STPODM);
  edtFTP.Text := PurchaseOrder.SupplierSiteURL(STPODM);
  edtUserName.Text := PurchaseOrder.SupplierAccountCode(STPODM);
  edtPassword.Text := PurchaseOrder.SupplierAccountPWord(STPODM);
  lstbxStatus.Items.Clear;
end;

procedure TPBSendEInvoiceViaFTPFrm.FTPStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
var
  Clr : TColor;
begin
  lstbxStatus.Items.add(AStatusText);
(*  clr := ApplicationConfig.LogColors.Colors['Default'];
  case AStatus of
    hsStatusText    : Clr := ApplicationConfig.LogColors.Colors['hsStatusText'];
    hsResolving     : Clr := ApplicationConfig.LogColors.Colors['hsResolving'];
    hsConnecting    : Clr := ApplicationConfig.LogColors.Colors['hsConnecting'];
    hsDisconnecting : Clr := ApplicationConfig.LogColors.Colors['hsDisconnecting'];
    hsConnected     : Clr := ApplicationConfig.LogColors.Colors['hsConnected'];
    hsDisconnected  : Clr := ApplicationConfig.LogColors.Colors['hsDisconnected'];
    ftpTransfer     : Clr := ApplicationConfig.LogColors.Colors['ftpTransfer'];
    ftpReady        : Clr := ApplicationConfig.LogColors.Colors['ftpReady'];
    ftpAborted      : Clr := ApplicationConfig.LogColors.Colors['ftpAborted'];

  end;
  Log(AStatusText, clr);
*)
end;

procedure TPBSendEInvoiceViaFTPFrm.Log(Msg: String; Color: TColor);
begin
  lstbxStatus.Items.AddObject(Msg, Pointer(Color));
  lstbxStatus.ItemIndex := lstbxStatus.Items.Count -1;
end;

procedure TPBSendEInvoiceViaFTPFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.
