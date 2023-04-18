unit UFLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmeLogin = class(TFrame)
    Layout2: TLayout;
    Layout1: TLayout;
    Layout17: TLayout;
    layloginCenter: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Layout5: TLayout;
    Layout8: TLayout;
    Label3: TLabel;
    Layout9: TLayout;
    Layout29: TLayout;
    Label9: TLabel;
    chkSalvaSenha: TSwitch;
    recPrincipal: TRectangle;
    Rectangle2: TRectangle;
    Image2: TImage;
    Rectangle3: TRectangle;
    edtSenha: TEdit;
    ClearEditButton1: TClearEditButton;
    PasswordEditButton1: TPasswordEditButton;
    btnLogin: TRectangle;
    Image1: TImage;
    Label1: TLabel;
    Layout3: TLayout;
    btnCloseAll: TImage;
    Rectangle4: TRectangle;
    edtUsuario: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout10: TLayout;
    Layout11: TLayout;
    Label4: TLabel;
    Rectangle5: TRectangle;
    StyleBook1: TStyleBook;
    cbxPropriedade: TComboBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField: TLinkFillControlToField;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnLoginMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnLoginMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure cbxPropriedadeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UPrincipal, UDmDB;

procedure TfrmeLogin.btnCloseAllClick(Sender: TObject);
begin
  MessageDlg('Deseja realmente sair do aplicativo?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
//     SharedActivity.finish;
     Application.Terminate;
   end);
end;

procedure TfrmeLogin.btnLoginClick(Sender: TObject);
begin
 if cbxPropriedade.ItemIndex=-1 then
 begin
   ShowMessage('Informe a propriedade!');
   Exit;
 end;
 frmPrincipal.MostraMenu;
 if dmDB.AutenticaUsuario(edtUsuario.Text,edtSenha.Text)then
 begin
  if chkSalvaSenha.IsChecked then
  begin
    dmdb.qryConfig.Close;
    dmdb.qryConfig.Open;
    dmdb.qryConfig.Edit;
    dmdb.qryConfigSalvarLogin.AsInteger :=1;
    dmdb.qryConfig.ApplyUpdates(-1);
    dmdb.SalvarAcesso(edtUsuario.Text,edtSenha.Text);
  end;
  Visible              := false;
  frmPrincipal.RecPrincipal.Visible := true;
  frmPrincipal.lblpropriedade.text := cbxPropriedade.Selected.Text;
  TThread.CreateAnonymousThread(procedure
  begin
   TThread.Synchronize(nil,procedure
   begin
     frmPrincipal.img_seta.Position.Y := 0;
     frmPrincipal.img_seta.Opacity := 0;
     frmPrincipal.img_seta.AnimateFloatDelay('Position.Y', 5, 0.5, 1, TAnimationType.Out, TInterpolationType.Back);
     frmPrincipal.img_seta.AnimateFloatDelay('Opacity', 1, 0.4, 0.9);
   end);
  end).Start;

 end
 else
  ShowMessage('Usuario ou senha invalidos!');
end;

procedure TfrmeLogin.btnLoginMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmeLogin.btnLoginMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
   TRectangle(sender).Opacity := 1;
end;

procedure TfrmeLogin.cbxPropriedadeChange(Sender: TObject);
begin
 if cbxPropriedade.ItemIndex>-1 then
  dmdb.vIdPropriedade :=LinkFillControlToField.BindList.GetSelectedValue.AsString;
end;

end.
