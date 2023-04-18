unit UFrameFormMineral;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TFrameFornMineral = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    lblPasto: TLabel;
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
    Layout8: TLayout;
    Layout9: TLayout;
    Label3: TLabel;
    lblRealizadoCocho: TLabel;
    Image5: TImage;
    Layout10: TLayout;
    Layout11: TLayout;
    Label4: TLabel;
    lblEstoqueCasinha: TLabel;
    lblMineral: TMemo;
    Label5: TLabel;
    lblRealizadoCochoKG: TLabel;
    Label7: TLabel;
    lblEstoqueCasinhaKG: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
