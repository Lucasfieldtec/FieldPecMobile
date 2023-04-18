unit UFrameListaInsumos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TFrameListaInsumos = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    lblInsumo: TLabel;
    layImg: TLayout;
    Image2: TImage;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Rectangle1: TRectangle;
    lblPrevisto: TLabel;
    Image6: TImage;
    Layout5: TLayout;
    Layout10: TLayout;
    Label5: TLabel;
    rectEdtRealizado: TRectangle;
    lblRealizado: TLabel;
    btnEditar: TRectangle;
    Layout12: TLayout;
    Label8: TLabel;
    Image7: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
