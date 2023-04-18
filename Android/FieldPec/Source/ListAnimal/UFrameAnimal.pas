unit UFrameAnimal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrameAnimal = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    layImg: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    lblIdentificacao: TLabel;
    lblSISBOV: TLabel;
    Layout5: TLayout;
    Image2: TImage;
    Layout6: TLayout;
    Image3: TImage;
    Layout7: TLayout;
    Layout8: TLayout;
    Image4: TImage;
    Layout9: TLayout;
    Layout10: TLayout;
    Label4: TLabel;
    lblLocalAtual: TLabel;
    Layout11: TLayout;
    Layout12: TLayout;
    Image5: TImage;
    Layout13: TLayout;
    Layout14: TLayout;
    Label5: TLabel;
    lblDataEnt: TLabel;
    Layout18: TLayout;
    lblRaca: TLabel;
    Layout19: TLayout;
    Label9: TLabel;
    Layout20: TLayout;
    lblCategoria: TLabel;
    Layout21: TLayout;
    Label10: TLabel;
    Layout22: TLayout;
    Image7: TImage;
    Layout23: TLayout;
    lblRebanho: TLabel;
    Layout24: TLayout;
    Label12: TLabel;
    Layout28: TLayout;
    Layout32: TLayout;
    Image10: TImage;
    Layout33: TLayout;
    Layout34: TLayout;
    Label6: TLabel;
    lblPesoEnt: TLabel;
    Layout35: TLayout;
    Image11: TImage;
    Layout36: TLayout;
    Layout37: TLayout;
    Label11: TLabel;
    lblPesoEstimado: TLabel;
    Layout15: TLayout;
    Image6: TImage;
    Layout16: TLayout;
    lblProdutor: TLabel;
    Layout17: TLayout;
    Label3: TLabel;
    Layout25: TLayout;
    Image8: TImage;
    Layout26: TLayout;
    lblPropriedade: TLabel;
    Layout27: TLayout;
    Label8: TLabel;
    Layout29: TLayout;
    Layout30: TLayout;
    Layout31: TLayout;
    Label7: TLabel;
    lblChip: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
