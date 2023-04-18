unit UFrameFabricacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrameFabricacao = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    lblRacao: TLabel;
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
    Rectangle1: TRectangle;
    lblPrevisto: TLabel;
    Label2: TLabel;
    Layout8: TLayout;
    Layout9: TLayout;
    Label3: TLabel;
    Rectangle2: TRectangle;
    lblRealizado: TLabel;
    Image4: TImage;
    recStatus: TRectangle;
    lblStatus: TLabel;
    btnInsumos: TRectangle;
    Layout24: TLayout;
    Label8: TLabel;
    Image5: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
