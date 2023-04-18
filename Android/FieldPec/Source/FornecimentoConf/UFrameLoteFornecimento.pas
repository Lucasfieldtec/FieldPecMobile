unit UFrameLoteFornecimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.WebBrowser;

type
  TFrameLoteFornecimento = class(TFrame)
    RecBack: TRectangle;
    Layout14: TLayout;
    Image2: TImage;
    Layout15: TLayout;
    lblCurral: TLabel;
    layImg: TLayout;
    Layout28: TLayout;
    Image8: TImage;
    Label12: TLabel;
    lblRacaoPrevista: TLabel;
    Layout31: TLayout;
    Image9: TImage;
    Label13: TLabel;
    lblLote: TLabel;
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    lblTrato: TLabel;
    Image4: TImage;
    Layout10: TLayout;
    Layout11: TLayout;
    Label3: TLabel;
    Rectangle1: TRectangle;
    lblPrevisto: TLabel;
    Layout12: TLayout;
    Layout13: TLayout;
    Label4: TLabel;
    Rectangle2: TRectangle;
    lblRealizado: TLabel;
    Image5: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
