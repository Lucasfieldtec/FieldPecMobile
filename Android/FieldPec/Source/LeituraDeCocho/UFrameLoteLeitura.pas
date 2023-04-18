unit UFrameLoteLeitura;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.WebBrowser;

type
  TFrameLoteLeitura = class(TFrame)
    RecBack: TRectangle;
    Layout14: TLayout;
    Image2: TImage;
    Layout15: TLayout;
    lblCurral: TLabel;
    layImg: TLayout;
    Layout20: TLayout;
    Image7: TImage;
    Label5: TLabel;
    lblqtdCabeca: TLabel;
    Layout28: TLayout;
    Image8: TImage;
    Label12: TLabel;
    lblDataEntrada: TLabel;
    Layout31: TLayout;
    Image9: TImage;
    Label13: TLabel;
    lblLote: TLabel;
    Layout32: TLayout;
    Image10: TImage;
    Label14: TLabel;
    lblPesoMedio: TLabel;
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    lblNota: TLabel;
    lblAjuste: TLabel;
    Label3: TLabel;
    Image3: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
