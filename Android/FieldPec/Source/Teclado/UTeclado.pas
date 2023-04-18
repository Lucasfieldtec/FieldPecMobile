unit UTeclado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts;

type
  TfrmTeclado = class(TForm)
    Rectangle1: TRectangle;
    lbl_valorPrev: TLabel;
    layout_valor: TLayout;
    Layout2: TLayout;
    lbl_tecla7: TLabel;
    Layout3: TLayout;
    lbl_tecla8: TLabel;
    Layout4: TLayout;
    lbl_tecla9: TLabel;
    lbl_tecla4: TLayout;
    Label5: TLabel;
    Layout6: TLayout;
    lbl_tecla5: TLabel;
    Layout7: TLayout;
    lbl_tecla6: TLabel;
    Layout8: TLayout;
    lbl_tecla1: TLabel;
    Layout9: TLayout;
    lbl_tecla2: TLabel;
    Layout10: TLayout;
    lbl_tecla3: TLabel;
    Layout11: TLayout;
    lbl_tecla00: TLabel;
    Layout12: TLayout;
    lbl_tecla0: TLabel;
    Layout13: TLayout;
    img_backspace: TImage;
    Rectangle3: TRectangle;
    Layout1: TLayout;
    layLimpaValor: TLayout;
    Circle1: TCircle;
    img_limpar: TImage;
    layConfirma: TLayout;
    Circle2: TCircle;
    img_salvar: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle2: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    lbl_valor: TLabel;
    Label6: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure lbl_tecla0Click(Sender: TObject);
    procedure img_backspaceClick(Sender: TObject);
    procedure layLimpaValorClick(Sender: TObject);
    procedure layConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    vValorIni,vValorFim:string;
  end;

var
  frmTeclado: TfrmTeclado;

implementation

{$R *.fmx}

procedure Tecla_Backspace();
var
 valor : string;
begin
  with frmTeclado do
  begin
    valor := lbl_valor.Text;  // 5.200,00
    valor := StringReplace(valor, '.', '', [rfReplaceAll]); // 5200,00
    valor := StringReplace(valor, ',', '', [rfReplaceAll]); // 520000
    if Length(valor) > 1 then
     valor := Copy(valor, 1, length(valor) - 1) // 520,00
    else
     valor := '';
    lbl_valor.Text := valor;
  end;
end;

procedure Tecla_Numero(lbl : TObject);
var
 valor : string;
begin
  with frmTeclado do
  begin
    valor := lbl_valor.Text;
    valor := StringReplace(valor, '.', '', [rfReplaceAll]);
    valor := StringReplace(valor, ',', '', [rfReplaceAll]);
    valor := valor + TLabel(lbl).Text;
    lbl_valor.Text := valor;
  end;
end;

procedure TfrmTeclado.img_backspaceClick(Sender: TObject);
begin
        Tecla_Backspace();
end;

procedure TfrmTeclado.Label1Click(Sender: TObject);
begin
  lbl_valor.Text := vValorIni;
end;

procedure TfrmTeclado.layConfirmaClick(Sender: TObject);
begin
 if lbl_valor.Text=''then
  vValorFim     := '0'
 else
  vValorFim     := lbl_valor.Text;
 Close;
end;

procedure TfrmTeclado.layLimpaValorClick(Sender: TObject);
begin
  lbl_valor.Text := '';
end;

procedure TfrmTeclado.lbl_tecla0Click(Sender: TObject);
begin
  Tecla_Numero(sender);
end;

end.
