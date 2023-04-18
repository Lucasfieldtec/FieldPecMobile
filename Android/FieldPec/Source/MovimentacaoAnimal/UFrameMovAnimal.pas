unit UFrameMovAnimal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrameMovAnimal = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    layImg: TLayout;
    Layout3: TLayout;
    Image3: TImage;
    Image2: TImage;
    imgSyncYes: TImage;
    layImgs: TLayout;
    imgSyncNO: TImage;
    lblSync: TLabel;
    Layout2: TLayout;
    lblData: TLabel;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Image4: TImage;
    Layout4: TLayout;
    Layout8: TLayout;
    Label3: TLabel;
    lblOrigem: TLabel;
    lblDestino: TLabel;
    Layout9: TLayout;
    Image5: TImage;
    Layout10: TLayout;
    lblMotivo: TLabel;
    Layout11: TLayout;
    lblMotivoText: TLabel;
    Image6: TImage;
    Layout12: TLayout;
    Layout13: TLayout;
    Label4: TLabel;
    lblIdentificacaoAnimal: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
