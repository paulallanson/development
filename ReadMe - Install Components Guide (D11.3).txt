How to prepare Delphi 11:

0. Required Delphi packages

TeeChart standard. Can be installed from Tools > Manage Platforms > Additional Options.

1. Create the following environment variable on your Delphi 11 IDE:

QSLIB = Root folder where the components are.
E.g.: C:\dev\views\quaystone\Components

2. Add the entries below to "Library path":

==>> Win32
;$(QSLIB)\dd-dropfiles-5.0.5\D280\Win32\Release;$(QSLIB)\CRPackage\D280\Win32\Release;$(QSLIB)\Zorn Barcode\D280\Win32\Release;$(QSLIB)\Zorn Barcode\Resources;$(QSLIB)\Turbo Async Pro\packages\Alexandria\Delphi\Win32\Release

3. Add the entries below to "Browsing path":

;$(QSLIB)\dd-dropfiles-5.0.5;$(QSLIB)\CRPackage;$(QSLIB)\Zorn Barcode;$(QSLIB)\Turbo Async Pro\source

4. Add the entries below to "Debug DCU path":

;$(QSLIB)\dd-dropfiles-5.0.5\D280\Win32\Debug;$(QSLIB)\CRPackage\D280\Win32\Debug;$(QSLIB)\Zorn Barcode\D280\Win32\Debug;$(QSLIB)\Turbo Async Pro\packages\Alexandria\Delphi\Win32\Debug

5. Alternatively, you can just add the path below to "Library path":

;$(QSLIB)\dd-dropfiles-5.0.5;$(QSLIB)\CRPackage;$(QSLIB)\Zorn Barcode;$(QSLIB)\Zorn Barcode\Resources;$(QSLIB)\Turbo Async Pro\source

6. Install the group project below, compiling both Release and Debug for all the packages in the group.

C:\dev\views\quaystone\Components\QComponentsPG.groupproj
C:\dev\views\quaystone\Components\Turbo Async Pro\packages\Alexandria\Delphi\AsyncProDelphi.groupproj

7. Install the other components as usual:

QuickReports
other packages as needed.