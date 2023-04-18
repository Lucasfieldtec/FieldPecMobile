program WS_FieldPec;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\Source\UPrincipal.pas' {frmPrincipal},
  UDmDB in '..\DM\UDmDB.pas' {dmDB: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDB, dmDB);
  Application.Run;
end.
