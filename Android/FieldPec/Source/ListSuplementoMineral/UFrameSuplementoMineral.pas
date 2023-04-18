unit UFrameSuplementoMineral;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects;

type
  TFrameSuplementoMineral = class(TFrame)
    RecBack: TRectangle;
    imgBomba: TImage;
    imgHorimetro: TImage;
    imgKM: TImage;
    Layout1: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    Image2: TImage;
    lblNome: TLabel;
    lblEmbalagemtxt: TLabel;
    lblEmbalagem: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
