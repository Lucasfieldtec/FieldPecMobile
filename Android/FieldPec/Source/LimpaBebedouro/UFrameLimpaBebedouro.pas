unit UFrameLimpaBebedouro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrameLimpaBebedouro = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    lblbebedouro: TLabel;
    layImg: TLayout;
    Layout3: TLayout;
    Image3: TImage;
    Image2: TImage;
    imgSyncYes: TImage;
    layImgs: TLayout;
    imgSyncNO: TImage;
    lblSync: TLabel;
    Layout2: TLayout;
    lblDataLimpeza: TLabel;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle1: TRectangle;
    lblObservacao: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
