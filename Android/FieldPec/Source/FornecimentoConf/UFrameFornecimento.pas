unit UFrameFornecimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, View.WebCharts;

type
  TFrameFornecimento = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    lblLote: TLabel;
    layImg: TLayout;
    Layout3: TLayout;
    Image3: TImage;
    Image2: TImage;
    imgSyncYes: TImage;
    layImgs: TLayout;
    imgSyncNO: TImage;
    lblSync: TLabel;
    Layout2: TLayout;
    lbldata: TLabel;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Label2: TLabel;
    lblDieta: TLabel;
    WebCharts1: TWebCharts;
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
