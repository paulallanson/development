/*
  Table creation and default value inserts for Broker/PageDesigner
  paper and letter layouts.
VSS Info:
  $Header: $
  $History: $

*/
if exists (select * from sysobjects where id = object_id(N'[dbo].[tb_LetterElement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tb_LetterElement]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[tb_LetterLayout]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tb_LetterLayout]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[tb_PageLayout]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tb_PageLayout]
GO

CREATE TABLE [dbo].[tb_LetterElement] (
	[f_LetterName] [varchar] (50) NOT NULL ,
	[f_ElementName] [varchar] (50) NOT NULL ,
  [f_Number] [int] NULL,
	[f_FontNo] [int] NULL ,
	[f_FontSize] [int] NULL ,
	[f_FontStyle] [int] NULL ,
	[f_PrintOrder] [int] NULL ,
	[f_Column] [int] NULL ,
	[f_Left] [int] NULL ,
	[f_Width] [int] NULL ,
  [f_Fixed] [char] NULL,
  [f_DbData] [char] NULL,
  [f_Printed] [char] NULL,
  [f_BlankBefore] [char] NULL,
  [f_BlankAfter] [char] NULL,
	[f_Text] [text] NULL ,
  [f_Alignment] [char] NULL ,
  [f_UsesTab] [char] NULL ,
	[f_Font2No] [int] NULL ,
	[f_Font2Size] [int] NULL ,
	[f_Font2Style] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_LetterLayout] (
	[f_LetterName] [varchar] (50) NOT NULL ,
  [f_LetterType] [int] NOT NULL ,
	[f_Font1Name] [varchar] (50) NULL ,
	[f_Font1Size] [int] NULL ,
	[f_Font1Style] [int] NULL ,
	[f_Font2Name] [varchar] (50) NULL ,
	[f_Font2Size] [int] NULL ,
	[f_Font2Style] [int] NULL ,
	[f_Font3Name] [varchar] (50) NULL ,
	[f_Font3Size] [int] NULL ,
	[f_Font3Style] [int] NULL ,
	[f_Font4Name] [varchar] (50) NULL ,
	[f_Font4Size] [int] NULL ,
	[f_Font4Style] [int] NULL ,
	[f_Font5Name] [varchar] (50) NULL ,
	[f_Font5Size] [int] NULL ,
	[f_Font5Style] [int] NULL ,
  [f_LetterTypeDefault] [char] (1) NULL ,
  [f_TabUnit] [varchar] (20) NULL ,
  [f_TabStop1] [numeric] (6, 2) NULL ,
  [f_TabStop2] [numeric] (6, 2) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_PageLayout] (
	[f_PageLayoutName] [varchar] (50) NOT NULL ,
	[f_TopMargin] [numeric](6, 2) NULL ,
	[f_LeftMargin] [numeric](6, 2) NULL ,
	[f_BottomMargin] [numeric](6, 2) NULL ,
	[f_RightMargin] [numeric](6, 2) NULL ,
	[f_Preprinted] [char] (1) NOT NULL ,
	[f_PrintLogo] [char] (1) NOT NULL ,
	[f_PrintAddress] [char] (1) NOT NULL ,
	[f_LogoTop] [numeric](6, 2) NULL ,
	[f_LogoLeft] [numeric](6, 2) NULL ,
	[f_LogoWidth] [numeric](6, 2) NULL ,
	[f_LogoHeight] [numeric](6, 2) NULL ,
	[f_AddressTop] [numeric](6, 2) NULL ,
	[f_AddressLeft] [numeric](6, 2) NULL ,
	[f_AddressWidth] [numeric](6, 2) NULL ,
	[f_AddressHeight] [numeric](6, 2) NULL ,
	[f_PaperSize] [varchar] (20) NULL ,
	[f_Portrait] [char] (1) NOT NULL ,
	[f_Units] [varchar] (20) NULL ,
	[f_PPTop] [numeric](6, 2) NULL ,
	[f_PPLeft] [numeric](6, 2) NULL ,
	[f_PPWidth] [numeric](6, 2) NULL ,
	[f_PPHeight] [numeric](6, 2) NULL ,
	[f_LogoFile] [varchar] (255) NULL ,
  [f_FaxDefault] [char] (1) NULL ,
  [f_PrintDefault] [char] (1) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_LetterElement] WITH NOCHECK ADD 
	CONSTRAINT [PK_tb_LetterElement] PRIMARY KEY  NONCLUSTERED 
	(
		[f_LetterName],
		[f_ElementName]
	)  ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_LetterLayout] WITH NOCHECK ADD 
	CONSTRAINT [PK_tb_LetterLayout] PRIMARY KEY  NONCLUSTERED
	(
		[f_LetterName]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tb_PageLayout] WITH NOCHECK ADD
	CONSTRAINT [PK_tb_PageLayout] PRIMARY KEY  NONCLUSTERED 
	(
		[f_PageLayoutName]
	)  ON [PRIMARY] 
GO


/* Default letter layout values */

INSERT INTO [dbo].[tb_LetterLayout]
VALUES ('Enquiry', 1,
  'Times New Roman', 12, 0,
  'Arial', 10, 7,
  'Courier New', 10, 2,
  null, null, null, null, null, null, 'Y', 'inches', 1.33, 3.43)
GO

INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Addressee', 1, 1, 12, 0, 1, 1, 0, 192,
'Y', 'Y', 'Y', 'N', 'Y',
'Supplier name and address', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Contact', 2, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Contact: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Date', 3, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Date: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Enquiry Heading', 4, 1, 12, 1, 2, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'ENQUIRY NO. ', 'C', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'To Whom', 5, 1, 12, 0, 3, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'For the attention of the estimating department', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Preamble', 6, 1, 12, 0, 4, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'We would be pleased to receive your Quotation and best delivery date ' +
'for the following item:-', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Description', 7, 1, 12, 1, 5, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'DESCRIPTION: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Parts Information', 8, 1, 12, 0, 6, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'PART ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'No of plates', 9, 1, 12, 0, 7, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'No of plates: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Notes', 16, 1, 12, 0, 8, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Notes: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Artwork', 10, 1, 12, 0, 9, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'N',
'Artwork: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Quantities', 11, 1, 12, 1, 10, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'N',
'QUANTITIES: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Boxed In', 12, 1, 12, 0, 11, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Boxed in: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Questions and Answers', 13, 1, 12, 0, 12, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Questions: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Additional Details', 14, 1, 12, 0, 13, 0, 0, 0,
'N', 'Y', 'Y', 'Y', 'Y',
'Additional details: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Quote Date', 15, 1, 12, 1, 14, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Quote required by: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Postamble', 17, 1, 12, 0, 15, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Thank you for your assistance, if you have any queries or suggestions ' +
'please do not hesitate to contact my sales administration team.', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Signatory', 18, 1, 12, 0, 16, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Yours sincerely,', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Enquiry', 'Continuation', 19, 1, 12, 1, 17, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Continuation...', 'L', 'N', 1, 12, 0)
GO

INSERT INTO [dbo].[tb_LetterLayout]
VALUES ('Quotation', 2,
  'Times New Roman', 12, 0,
  'Arial', 10, 7,
  'Courier New', 10, 2,
  null, null, null, null, null, null, 'Y', 'inches', 1.33, 3.43)
GO

INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Addressee', 1, 1, 12, 0, 1, 1, 0, 192,
'Y', 'Y', 'Y', 'N', 'Y',
'Customer name and address', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Contact', 2, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Contact: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Date', 3, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Date: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Quotation Heading', 4, 1, 12, 1, 2, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'QUOTATION NO. ', 'C', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'To Whom', 5, 1, 12, 0, 3, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Dear ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Preamble', 6, 1, 12, 0, 4, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'We thank you for your recent enquiry and are pleased to offer the ' +
'following price(s) for your consideration:-', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Description', 7, 1, 12, 1, 5, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'DESCRIPTION: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Parts Information', 8, 1, 12, 0, 6, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Part ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'No of plates', 9, 1, 12, 0, 7, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'No of plates', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Notes', 15, 1, 12, 0, 8, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Notes: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Artwork', 10, 1, 12, 0, 9, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'N',
'Artwork: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Boxed In', 12, 1, 12, 0, 10, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Boxed in: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Questions and Answers', 13, 1, 12, 0, 11, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Questions: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Additional Details', 14, 1, 12, 0, 12, 0, 0, 0,
'N', 'Y', 'Y', 'Y', 'Y',
'Additional details: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Price', 11, 1, 12, 1, 13, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Price: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Postamble', 16, 1, 12, 0, 14, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Our quoted prices are subject to final copy and are firm for 30 days ' +
'unless otherwise agreed in writing.  We trust this price meets your approval ' +
'and look forward to receiving your instructions. ' + CHAR(10) + CHAR(10) +
'All prices are exclusive of VAT at the ruling rate at date of invoice.', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Signatory', 17, 1, 12, 0, 15, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Yours sincerely,', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation', 'Continuation', 18, 1, 12, 1, 16, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Continuation...', 'L', 'N', 1, 12, 0)
GO

INSERT INTO [dbo].[tb_LetterLayout]
VALUES ('Purchase Order', 3,
  'Times New Roman', 12, 0,
  'Arial', 10, 7,
  'Courier New', 10, 2,
  null, null, null, null, null, null, 'Y', 'inches', 1.33, 3.43)
GO

INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Addressee', 1, 1, 12, 0, 1, 1, 0, 192,
'Y', 'Y', 'Y', 'N', 'Y',
'Supplier name and address', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Contact', 2, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Contact: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Date', 3, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Date: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Reference', 4, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Ref: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'To Whom', 5, 1, 12, 0, 2, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Dear ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Purchase Order Heading', 6, 1, 12, 1, 3, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
' PURCHASE ORDER NO. ', 'C', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Preamble', 7, 1, 12, 0, 4, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'We are pleased to confirm our Order for your Quotation referred to above. ' +
'Please proceed as specified below and acknowledge our order by return.', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Description', 8, 1, 12, 1, 5, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'DESCRIPTION: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Parts Information', 9, 1, 12, 0, 6, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Part ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'No of plates', 10, 1, 12, 0, 7, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'No of plates: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Notes', 19, 1, 12, 0, 8, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Notes:', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Artwork', 11, 1, 12, 0, 9, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'N',
'Artwork: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Boxed In', 13, 1, 12, 0, 10, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Boxed in: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Additional Details', 14, 1, 12, 0, 11, 0, 0, 0,
'N', 'Y', 'Y', 'Y', 'Y',
'Additional details: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Questions', 15, 1, 12, 0, 12, 1, 0, 0,
'N', 'Y', 'N', 'Y', 'Y',
'Questions: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'QuantityPrice', 12, 1, 12, 1, 13, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'QUANTITY: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Additional Charges', 16, 1, 12, 0, 14, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Extra charges: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Date Required', 17, 1, 12, 0, 15, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Date required: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Deliver to', 18, 1, 12, 0, 16, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Delivery: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Postamble', 20, 1, 12, 0, 17, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Should you have any problems interpreting this order or have a query '+
'with this specification, please contact us immediately.', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Signatory', 21, 1, 12, 0, 18, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Signed for and on behalf of <company name>', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Purchase Order', 'Continuation', 22, 1, 12, 1, 19, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Continuation...', 'L', 'N', 1, 12, 0)
GO

INSERT INTO [dbo].[tb_LetterLayout]
VALUES ('Acknowledgement', 4,
  'Times New Roman', 12, 0,
  'Arial', 10, 7,
  'Courier New', 10, 2,
  null, null, null, null, null, null, 'Y', 'inches', 1.33, 3.43)
GO

INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Addressee', 1, 1, 12, 0, 1, 1, 0, 192,
'Y', 'Y', 'Y', 'N', 'Y',
'Customer name and address', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Contact', 2, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Contact: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Date', 3, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Date: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Reference', 4, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Ref: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'To Whom', 5, 1, 12, 0, 2, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Dear ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Acknowledgement Heading', 6, 1, 12, 1, 3, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'ORDER ACKNOWLEDGEMENT NO. ', 'C', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Preamble', 7, 1, 12, 0, 4, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'We thank you and are pleased to confirm your Order Number as detailed above. ' +
'We draw your attention to our Standard Terms and Conditions, in particular ' +
'to clause 13.5 relating to unders and overs. We are proceeding as specified below:-', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Description', 8, 1, 12, 1, 5, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'DESCRIPTION: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Parts Information', 9, 1, 12, 0, 6, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Part ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'No of plates', 10, 1, 12, 0, 7, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'No of plates: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Notes', 19, 1, 12, 0, 8, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Notes: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Artwork', 11, 1, 12, 0, 9, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'N',
'Artwork: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Boxed In', 13, 1, 12, 0, 10, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Boxed in: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Additional Details', 14, 1, 12, 0, 11, 0, 0, 0,
'N', 'Y', 'Y', 'Y', 'Y',
'Additional details: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Questions', 15, 1, 12, 0, 12, 1, 0, 0,
'N', 'Y', 'N', 'Y', 'Y',
'Questions: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'QuantityPrice', 12, 1, 12, 1, 13, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'QUANTITY: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Additional Charges', 16, 1, 12, 0, 14, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Extra charges: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Date Required', 17, 1, 12, 0, 15, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Date required: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Deliver to', 18, 1, 12, 0, 16, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Delivery: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Postamble', 20, 1, 12, 0, 17, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Please check the above information carefully and advise us immediately if it '+
'does not meet with your exact requirements. Unless discrepancies or changes ' +
'are notified by return in writing we cannot accept responsibility for any ' +
'errors which may be incurred.', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Signatory', 21, 1, 12, 0, 18, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Yours sincerely,', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Acknowledgement', 'Continuation', 22, 1, 12, 1, 19, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Continuation...', 'L', 'N', 1, 12, 0)
GO

INSERT INTO [dbo].[tb_LetterLayout]
VALUES ('Quotation Summary', 5,
  'Times New Roman', 12, 0,
  'Arial', 10, 7,
  'Courier New', 10, 2,
  null, null, null, null, null, null, 'Y', 'inches', 1.33, 3.43)
GO

INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Addressee', 1, 1, 12, 0, 1, 1, 0, 192,
'Y', 'Y', 'Y', 'N', 'Y',
'Customer name and address', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Contact', 2, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Contact: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Date', 3, 1, 12, 0, 1, 2, 208, 150,
'N', 'Y', 'Y', 'N', 'Y',
'Date: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Quotation Summary Heading', 4, 1, 12, 1, 2, 0, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Quotation Summary No. ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'To Whom', 5, 1, 12, 0, 3, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Dear ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Preamble', 6, 1, 12, 0, 4, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'We thank you for your recent enquiry and are pleased to offer the ' +
'following price(s) for your consideration:-', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Description', 7, 1, 12, 1, 5, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'DESCRIPTION: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Parts Information', 8, 1, 12, 0, 6, 1, 0, 0,
'N', 'Y', 'N', 'N', 'Y',
'Part ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'No of plates', 9, 1, 12, 0, 7, 1, 0, 0,
'N', 'Y', 'N', 'N', 'Y',
'No of plates: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Notes', 15, 1, 12, 0, 8, 0, 0, 0,
'N', 'Y', 'N', 'N', 'Y',
'Notes: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Artwork', 10, 1, 12, 0, 9, 1, 0, 0,
'N', 'Y', 'N', 'N', 'N',
'Artwork: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Boxed In', 12, 1, 12, 0, 10, 1, 0, 0,
'N', 'Y', 'N', 'N', 'Y',
'Boxed in: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Questions and Answers', 13, 1, 12, 0, 11, 1, 0, 0,
'N', 'Y', 'N', 'N', 'Y',
'Questions: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Additional Details', 14, 1, 12, 0, 12, 0, 0, 0,
'N', 'Y', 'N', 'Y', 'Y',
'Additional details: ', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Price', 11, 1, 12, 1, 13, 1, 0, 0,
'N', 'Y', 'Y', 'N', 'Y',
'Price: ', 'L', 'Y', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Postamble', 16, 1, 12, 0, 14, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Our quoted prices are subject to final copy and are firm for 30 days ' +
'unless otherwise agreed in writing.  We trust this price meets your approval ' +
'and look forward to receiving your instructions. ' + CHAR(10) + CHAR(10) +
'All prices are exclusive of VAT at the ruling rate at date of invoice.', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Signatory', 17, 1, 12, 0, 15, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Yours sincerely,', 'L', 'N', 1, 12, 0)
INSERT INTO [dbo].[tb_LetterElement]
VALUES ('Quotation Summary', 'Continuation', 18, 1, 12, 1, 16, 0, 0, 0,
'N', 'N', 'Y', 'N', 'Y',
'Continuation...', 'L', 'N', 1, 12, 0)
GO

INSERT INTO [dbo].[tb_PageLayout]
VALUES('Blank', 1, 1, 1, 1, 'N', 'Y', 'Y', 0.5, 6, 2, 2,
  2.6, 6, 2, 1.5, 'A4', 'Y', 'Inches', null, null, null, null, null,
  'Y', 'Y')
INSERT INTO [dbo].[tb_PageLayout]
VALUES('Preprinted', 1, 1, 1, 1, 'Y', 'N', 'N', null, null, null, null,
  null, null, null, null, 'A4', 'Y', 'Inches', 0.6, 6, 2, 4, null,
  'N', 'N')
GO

