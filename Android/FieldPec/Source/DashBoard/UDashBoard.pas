unit UDashBoard;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  View.WebCharts, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Effects, FMX.Objects, FMX.TabControl,Charts.Types,uCombobox,FMX.Platform,
  FMX.Edit, FMX.ListBox, FMX.DateTimeCtrls, FMX.TMSFNCTypes, FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes, FMX.TMSFNCChart;

type
  TfrmDashBoard = class(TForm)
    tbPrincipal: TTabControl;
    tbiResumo: TTabItem;
    tbiConsumo: TTabItem;
    recPst: TRectangle;
    Layout1: TLayout;
    Layout10: TLayout;
    Rectangle8: TRectangle;
    Layout11: TLayout;
    Image9: TImage;
    Layout12: TLayout;
    lbldashTotalAni: TLabel;
    Image10: TImage;
    Label8: TLabel;
    Layout13: TLayout;
    Rectangle9: TRectangle;
    Layout14: TLayout;
    Image11: TImage;
    Layout15: TLayout;
    lblDashPesoMed: TLabel;
    Label10: TLabel;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    layPasto: TLayout;
    recMachoPst: TRectangle;
    Layout167: TLayout;
    Image120: TImage;
    Layout170: TLayout;
    lblPastoMacho: TLabel;
    recFemeaPst: TRectangle;
    Layout166: TLayout;
    Image121: TImage;
    Layout171: TLayout;
    lblPastoFemea: TLabel;
    VertScrollBox1: TVertScrollBox;
    Layout3: TLayout;
    btnCloseAll: TImage;
    Label62: TLabel;
    VertScrollBox2: TVertScrollBox;
    recDados: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Layout6: TLayout;
    Image1: TImage;
    Layout7: TLayout;
    lblTotalAnimais: TLabel;
    Label2: TLabel;
    Layout8: TLayout;
    Rectangle4: TRectangle;
    Layout9: TLayout;
    Image3: TImage;
    Layout16: TLayout;
    lblPesoMedio: TLabel;
    Label4: TLabel;
    Layout23: TLayout;
    Image6: TImage;
    TabItem1: TTabItem;
    recLocal: TRectangle;
    Layout17: TLayout;
    layNota: TLayout;
    lblLocal: TLabel;
    cbxLocal: TRoundRect;
    Image4: TImage;
    lblCurral: TLabel;
    Layout19: TLayout;
    Rectangle6: TRectangle;
    Layout20: TLayout;
    Image2: TImage;
    Layout21: TLayout;
    lblDiasMedio: TLabel;
    Label3: TLabel;
    layFiltroForn: TLayout;
    Layout22: TLayout;
    Label1: TLabel;
    Label5: TLabel;
    Layout24: TLayout;
    Rectangle2: TRectangle;
    edtFData: TDateEdit;
    layFiltroForn2: TLayout;
    Layout26: TLayout;
    Layout27: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    Rectangle23: TRectangle;
    cbxTratoF: TComboBox;
    Rectangle7: TRectangle;
    edtLinhaF: TEdit;
    Rectangle5: TRectangle;
    edtRacao: TEdit;
    ClearEditButton1: TClearEditButton;
    Layout28: TLayout;
    btnBuscaFiltro: TRectangle;
    Layout32: TLayout;
    Label9: TLabel;
    Image5: TImage;
    Layout29: TLayout;
    Image7: TImage;
    Layout18: TLayout;
    VertScrollBox3: TVertScrollBox;
    ChartCategorias: TTMSFNCChart;
    ChartRebanho: TTMSFNCChart;
    ChartRaca: TTMSFNCChart;
    LayCharts: TLayout;
    ChartLotacao: TTMSFNCChart;
    VertScrollBox4: TVertScrollBox;
    TMSFNCChart1: TTMSFNCChart;
    TMSFNCChart2: TTMSFNCChart;
    TMSFNCChart3: TTMSFNCChart;
    procedure btnCloseAllClick(Sender: TObject);
    procedure cbxLocalClick(Sender: TObject);
    procedure btnBuscaFiltroMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnBuscaFiltroMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormResize(Sender: TObject);
    procedure edtRacaoClick(Sender: TObject);
    procedure btnBuscaFiltroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblCurralClick(Sender: TObject);
  private
    { Private declarations }
  public
    vIdCurral,vIdRacao:string;
    vTabInex:integer;
    c          : TCustomCombo;
    procedure GeraCombo;
    {$IFDEF ANDROID}
     procedure ItemLoteClick(Sender: TObject; const Point: TPointF);
     procedure ItemRacaoClick(Sender: TObject; const Point: TPointF);
    {$ENDIF}
    {$IFDEF MSWINDOWS}
     procedure ItemLoteClick(Sender: TObject);
     procedure ItemRacaoClick(Sender: TObject);
    {$ENDIF}
    procedure GeraGrafico(IdLocal: string);
    procedure GeraComboRacao;
  end;

var
  frmDashBoard: TfrmDashBoard;

implementation

{$R *.fmx}

uses UDMDashBoard, UDmDB;

procedure TfrmDashBoard.btnBuscaFiltroClick(Sender: TObject);
var
 vData,
 vLinha,
 vTrato :string;
begin

end;

procedure TfrmDashBoard.btnBuscaFiltroMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmDashBoard.btnBuscaFiltroMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(sender).Opacity := 1;
end;

procedure TfrmDashBoard.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmDashBoard.cbxLocalClick(Sender: TObject);
begin
  GeraCombo;
  c.ShowMenu;
end;

procedure TfrmDashBoard.edtRacaoClick(Sender: TObject);
begin
 GeraComboRacao;
 c.ShowMenu;

end;
{$IFDEF ANDROID}
procedure TfrmDashBoard.ItemRacaoClick(Sender: TObject; const Point: TPointF);
begin
 c.HideMenu;
 edtRacao.Text     := c.NomeItem;
 vIdRacao          := c.CodItem;

end;
procedure TfrmDashBoard.lblCurralClick(Sender: TObject);
begin

end;

{$ENDIF}
{$IFDEF MSWINDOWS}
procedure TfrmDashBoard.ItemRacaoClick(Sender: TObject);
begin
 c.HideMenu;
 edtRacao.Text     := c.NomeItem;
 vIdRacao          := c.CodItem;
 WebBrowser3.Visible := true;
end;
{$ENDIF}
procedure TfrmDashBoard.GeraComboRacao;
begin
  c := TCustomCombo.Create(frmDashBoard);
  c.TitleMenuText := 'Escolha uma Racao';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemRacaoClick;
  dmDB.RACAO.Close;
  dmDB.RACAO.Open;
  dmDB.RACAO.First;
  while not dmDB.RACAO.Eof do
  begin
    c.AddItem(
     dmDB.RACAOID.AsString,
     dmDB.RACAOMATERIASECA.AsString,
     dmDB.RACAONOME.AsString
    );
    dmDB.RACAO.Next;
  end;
end;

procedure TfrmDashBoard.FormResize(Sender: TObject);
var
  ScreenService: IFMXScreenService;
begin
 if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
  begin
    if ScreenService.GetScreenOrientation in [TScreenOrientation.Portrait, TScreenOrientation.Portrait] then
    begin
     recDados.Visible       := true;
     recLocal.Visible       := true;
     layFiltroForn.Visible  := true;
     layFiltroForn2.Visible := true;
    end
    else
     begin
      recDados.Visible      := false;
      recLocal.Visible      := false;
      layFiltroForn.Visible := false;
     layFiltroForn2.Visible := false;
     End;
  end;
end;

procedure TfrmDashBoard.FormShow(Sender: TObject);
var
  I, J: Integer;
  s: TTMSFNCChartSerie;
begin
    LayCharts.Visible := false;

   if vTabInex=0 then
   begin
    tbPrincipal.TabPosition := TTabPosition.None;
    tbPrincipal.ActiveTab   := tbiResumo;
    dmDash.GeraResumo;
    //
    ChartCategorias.BeginUpdate;
    ChartCategorias.Title.Text := 'Animais Por Categoria';
    ChartCategorias.Title.Height       := 50;
    ChartCategorias.Title.TextHorizontalAlignment := gtaLeading;
    ChartCategorias.Title.Font.Color   := gcDarkslategray;
    ChartCategorias.Title.Stroke.Color := gcDarkslategray;
    ChartCategorias.Title.Font.Size    := 20;
    ChartCategorias.Title.Font.Style   := ChartCategorias.Title.Font.Style + [TFontStyle.fsBold];
    ChartCategorias.Legend.Visible     := false;
    ChartCategorias.YAxis.Stroke.Color := gcDarkslategray;
    ChartCategorias.XAxis.Stroke.Color := gcDarkslategray;
    ChartCategorias.YAxis.Positions    := [ypLeft];
    ChartCategorias.XAxis.Positions    := [xpBottom];
    ChartCategorias.Stroke.Color       := gcDarkslategray;
    ChartCategorias.Fill.Color         := gcWhite;

    ChartCategorias.SeriesMargins.Left   := 0;
    ChartCategorias.SeriesMargins.Top    := 0;
    ChartCategorias.SeriesMargins.Right  := 0;
    ChartCategorias.SeriesMargins.Bottom := 0;

    ChartCategorias.Series.Clear;
    s := ChartCategorias.Series.Add;
    s.Fill.Kind         := gfkSolid;
    s.Fill.Orientation  := gfoHorizontal;
    s.Fill.Color        := gcLightblue;
    s.Stroke.Color      := gcBlack;
    s.Labels.Font.Color := gcBlack;
    s.YValues.Positions := [ypLeft];
    s.XValues.Positions := [xpBottom];
    s.XGrid.Visible := True;
    s.YGrid.Visible := True;
    s.XValues.Title.Font.Color := gcDarkslategray;
    s.XValues.Title.Font.Size := 5;
    s.XValues.Title.Font.Style := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
    s.XValues.Title.TextHorizontalAlignment := gtaTrailing;
    s.XValues.Title.TextMargins.Right := 10;

    s.YValues.Title.Font.Color := gcDarkslategray;
    s.YValues.Title.Font.Size := 10;
    s.YValues.Title.Font.Style := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
    s.YValues.Title.TextVerticalAlignment := gtaLeading;

    s.AutoXRange := arEnabled;
    s.AutoYRange := arEnabled;
    s.Mode       := smStatistical;
    s.ChartType  := ctBar;

    s.Legend.Visible      := false;

    s.Labels.Fill.Color   := s.Fill.Color;
    s.Labels.Stroke.Color := s.Stroke.Color;

    s.Labels.Visible := True;
    s.YValues.MajorUnitFormat := '%g';
    s.Labels.Visible := True;
    s.Labels.Format := '%g';

    s.XValues.MajorUnitFont.Size := 7;
    s.YValues.MajorUnitFont.Size := 10;
    s.XValues.MinorUnitFont.Size := 10;
    s.YValues.MinorUnitFont.Size := 7;
    s.XValues.MajorUnitFont.Color    := gcDarkslategray;
    s.XValues.MajorUnitTickMarkColor := gcDarkslategray;
    s.YValues.MajorUnitFont.Color    := gcDarkslategray;
    s.YValues.MajorUnitTickMarkColor := gcDarkslategray;

    while not dmDash.AnimalCategoria.eof  do
    begin
      s.AddPoint(dmDash.AnimalCategoria.FieldByName('value').AsFloat,
      dmDash.AnimalCategoria.FieldByName('label').AsString);
      dmDash.AnimalCategoria.Next;
    end;
    ChartCategorias.EndUpdate;


  //Raca
    ChartRaca.BeginUpdate;
    ChartRaca.Clear;
    ChartRaca.Title.Text := 'Animal por Raça';
    ChartRaca.Title.Height := 30;
    ChartRaca.Title.TextHorizontalAlignment := gtaLeading;
    ChartRaca.Title.Font.Color   := gcDarkslategray;
    ChartRaca.Title.Stroke.Color := gcDarkslategray;
    ChartRaca.Title.Font.Size    := 16;
    ChartRaca.Title.Font.Style   := ChartRaca.Title.Font.Style + [TFontStyle.fsBold];
    ChartRaca.Legend.Visible     := false;
    ChartRaca.YAxis.Stroke.Color := gcDarkslategray;
    ChartRaca.XAxis.Stroke.Color := gcDarkslategray;
    ChartRaca.YAxis.Positions    := [ypLeft];
    ChartRaca.XAxis.Positions    := [xpBottom];
    ChartRaca.Stroke.Color       := gcDarkslategray;
    ChartRaca.Fill.Color         := gcWhite;
    ChartRaca.Margins.Top        := 5;

    ChartRaca.SeriesMargins.Left   := 5;
    ChartRaca.SeriesMargins.Top    := 5;
    ChartRaca.SeriesMargins.Right  := 5;
    ChartRaca.SeriesMargins.Bottom := 5;

    ChartRaca.Series.Clear;
    s := ChartRaca.Series.Add;

    s.Fill.Kind         := gfkSolid;
    s.Fill.Orientation  := gfoHorizontal;
    s.Fill.Color        := gcLightblue;
    s.Stroke.Color      := gcBlack;
    s.Labels.Font.Color := gcBlack;


    s.AutoXRange := arEnabled;
    s.AutoYRange := arEnabled;

     s.XGrid.Visible := True;
     s.YGrid.Visible := True;

    s.ChartType := ctBar;

    s.Labels.Fill.Color   := s.Fill.Color;
    s.Labels.Stroke.Color := s.Stroke.Color;

    s.Labels.Visible := True;
    s.YValues.MajorUnitFormat := '%g';
    s.Labels.Visible := True;
    s.Labels.Format := '%g';
    s.XValues.MajorUnitFont.Size := 7;
    s.YValues.MajorUnitFont.Size := 12;
    s.XValues.MinorUnitFont.Size := 7;
    s.YValues.MinorUnitFont.Size := 12;
    s.XValues.MajorUnitFont.Color    := gcDarkslategray;
    s.XValues.MajorUnitTickMarkColor := gcDarkslategray;
    s.YValues.MajorUnitFont.Color    := gcDarkslategray;
    s.YValues.MajorUnitTickMarkColor := gcDarkslategray;
    s.Legend.Visible := false;
    while not dmDash.AnimalRaca.eof  do
    begin
      s.AddPoint(dmDash.AnimalRaca.FieldByName('value').AsFloat,
       dmDash.AnimalRaca.FieldByName('label').AsString);
      dmDash.AnimalRaca.Next;
    end;
    ChartRaca.EndUpdate;


  //Rebanho
    ChartRebanho.BeginUpdate;
    ChartRebanho.Clear;
    ChartRebanho.Title.Text := 'Animal por Rebanho';
    ChartRebanho.Title.Height := 30;
    ChartRebanho.Title.TextHorizontalAlignment := gtaLeading;
    ChartRebanho.Title.Font.Color := gcDarkslategray;
    ChartRebanho.Title.Stroke.Color := gcDarkslategray;
    ChartRebanho.Title.Font.Size := 16;
    ChartRebanho.Title.Font.Style := ChartRebanho.Title.Font.Style + [TFontStyle.fsBold];
    ChartRebanho.Legend.Visible := false;
    ChartRebanho.YAxis.Stroke.Color  := gcDarkslategray;
    ChartRebanho.XAxis.Stroke.Color  := gcDarkslategray;
    ChartRebanho.YAxis.Positions := [ypLeft];
    ChartRebanho.XAxis.Positions := [xpBottom];
    ChartRebanho.Stroke.Color    := gcDarkslategray;
    ChartRebanho.Fill.Color      := gcWhite;
    ChartRebanho.Margins.Top     := 5;

    ChartRebanho.SeriesMargins.Left   := 5;
    ChartRebanho.SeriesMargins.Top    := 5;
    ChartRebanho.SeriesMargins.Right  := 5;
    ChartRebanho.SeriesMargins.Bottom := 5;

    ChartRebanho.Series.Clear;
    s := ChartRebanho.Series.Add;

    s.Fill.Kind         := gfkSolid;
    s.Fill.Orientation  := gfoHorizontal;
    s.Fill.Color        := gcLightblue;
    s.Stroke.Color      := gcBlack;
    s.Labels.Font.Color := gcBlack;


    s.AutoXRange := arEnabled;
    s.AutoYRange := arEnabled;

    s.XGrid.Visible := True;
    s.YGrid.Visible := True;

    s.ChartType := ctBar;

    s.Labels.Fill.Color := s.Fill.Color;
    s.Labels.Stroke.Color := s.Stroke.Color;

    s.Labels.Visible := True;
    s.YValues.MajorUnitFormat := '%g';
    s.Labels.Visible := True;
    s.Labels.Format := '%g';

    s.XValues.MajorUnitFont.Size := 7;
    s.YValues.MajorUnitFont.Size := 12;
    s.XValues.MinorUnitFont.Size := 7;
    s.YValues.MinorUnitFont.Size := 12;
    s.XValues.MajorUnitFont.Color    := gcDarkslategray;
    s.XValues.MajorUnitTickMarkColor := gcDarkslategray;
    s.YValues.MajorUnitFont.Color    := gcDarkslategray;
    s.YValues.MajorUnitTickMarkColor := gcDarkslategray;
    s.Legend.Visible := false;
    while not dmDash.AnimalRebanho.eof  do
    begin
      s.AddPoint(dmDash.AnimalRebanho.FieldByName('value').AsFloat,
       dmDash.AnimalRebanho.FieldByName('label').AsString);
      dmDash.AnimalRebanho.Next;
    end;
    ChartRebanho.EndUpdate;


//    //Lotacao
//    ChartLotacao.BeginUpdate;
//    ChartLotacao.Clear;
//    ChartLotacao.Title.Text := 'Animal por Curral';
//    ChartLotacao.Title.Height := 30;
//    ChartLotacao.Title.TextHorizontalAlignment := gtaLeading;
//    ChartLotacao.Title.Font.Color := gcDarkslategray;
//    ChartLotacao.Title.Stroke.Color := gcDarkslategray;
//    ChartLotacao.Title.Font.Size := 16;
//    ChartLotacao.Title.Font.Style := ChartLotacao.Title.Font.Style + [TFontStyle.fsBold];
//    ChartLotacao.Legend.Visible := false;
//    ChartLotacao.YAxis.Stroke.Color  := gcDarkslategray;
//    ChartLotacao.XAxis.Stroke.Color  := gcDarkslategray;
//    ChartLotacao.YAxis.Positions := [ypLeft];
//    ChartLotacao.XAxis.Positions := [xpBottom];
//    ChartLotacao.Stroke.Color    := gcDarkslategray;
//    ChartLotacao.Fill.Color      := gcWhite;
//    ChartLotacao.Margins.Top     := 5;
//
//    ChartLotacao.SeriesMargins.Left   := 5;
//    ChartLotacao.SeriesMargins.Top    := 5;
//    ChartLotacao.SeriesMargins.Right  := 5;
//    ChartLotacao.SeriesMargins.Bottom := 5;
//
//    ChartLotacao.Series.Clear;
//    s := ChartLotacao.Series.Add;
//
//    s.Fill.Kind         := gfkSolid;
//    s.Fill.Orientation  := gfoHorizontal;
//    s.Fill.Color        := gcLightblue;
//    s.Stroke.Color      := gcBlack;
//    s.Labels.Font.Color := gcWhite;
//
//
//    s.AutoXRange := arEnabled;
//    s.AutoYRange := arEnabled;
//
//    s.ChartType := ctBar;
//
//    s.Labels.Fill.Color := s.Fill.Color;
//    s.Labels.Stroke.Color := s.Stroke.Color;
//
//    s.Labels.Visible := True;
//    s.XValues.MajorUnitFont.Size := 12;
//    s.YValues.MajorUnitFont.Size := 12;
//    s.XValues.MinorUnitFont.Size := 12;
//    s.YValues.MinorUnitFont.Size := 12;
//    s.XValues.MajorUnitFont.Color    := gcDarkslategray;
//    s.XValues.MajorUnitTickMarkColor := gcDarkslategray;
//    s.YValues.MajorUnitFont.Color    := gcDarkslategray;
//    s.YValues.MajorUnitTickMarkColor := gcDarkslategray;
//    s.Legend.Visible := false;
//    while not dmDash.qtdCabLocal.eof  do
//    begin
//      s.AddPoint(dmDash.qtdCabLocal.FieldByName('value').AsFloat,
//       TAlphaColorRec.Darkgreen,
//       dmDash.qtdCabLocal.FieldByName('label').AsString);
//      dmDash.qtdCabLocal.Next;
//    end;
//    ChartLotacao.EndUpdate;
   end
   else
   begin
     tbPrincipal.TabPosition := TTabPosition.None;
     tbPrincipal.ActiveTab   := tbiConsumo;
   end;
end;

procedure TfrmDashBoard.GeraGrafico(IdLocal: string);
var
  I, J: Integer;
  s: TTMSFNCChartSerie;
begin
  dmDash.AbreHistConsumo(IdLocal);

  TMSFNCChart1.Title.Text := 'Consumo MN';
  TMSFNCChart1.Title.Height       := 50;
  TMSFNCChart1.Title.TextHorizontalAlignment := gtaLeading;
  TMSFNCChart1.Title.Font.Color   := gcDarkslategray;
  TMSFNCChart1.Title.Stroke.Color := gcDarkslategray;
  TMSFNCChart1.Title.Font.Size    := 20;
  TMSFNCChart1.Title.Font.Style   := TMSFNCChart1.Title.Font.Style + [TFontStyle.fsBold];
  TMSFNCChart1.Legend.Visible     := false;
  TMSFNCChart1.YAxis.Stroke.Color := gcDarkslategray;
  TMSFNCChart1.XAxis.Stroke.Color := gcDarkslategray;
  TMSFNCChart1.YAxis.Positions    := [ypLeft];
  TMSFNCChart1.XAxis.Positions    := [xpBottom];
  TMSFNCChart1.Stroke.Color       := gcDarkslategray;
  TMSFNCChart1.Fill.Color         := gcWhite;

  TMSFNCChart1.SeriesMargins.Left := 0;
  TMSFNCChart1.SeriesMargins.Top := 0;
  TMSFNCChart1.SeriesMargins.Right := 0;
  TMSFNCChart1.SeriesMargins.Bottom := 0;

  TMSFNCChart1.Series.Clear;
  s := TMSFNCChart1.Series.Add;
  s.YValues.Positions := [ypLeft];
  s.XValues.Positions := [xpBottom];
  s.XGrid.Visible := True;
  s.YGrid.Visible := True;
  s.XValues.Title.Font.Color := gcDarkslategray;
  s.XValues.Title.Font.Size := 5;
  s.XValues.Title.Font.Style := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
  s.XValues.Title.TextHorizontalAlignment := gtaTrailing;
  s.XValues.Title.TextMargins.Right := 10;

  s.YValues.Title.Font.Color := gcDarkslategray;
  s.YValues.Title.Font.Size := 10;
  s.YValues.Title.Font.Style := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
  s.YValues.Title.TextVerticalAlignment := gtaLeading;

  s.AutoXRange := arEnabled;
  s.AutoYRange := arEnabled;
  s.Mode       := smStatistical;
  s.ChartType  := ctLine;

  s.Legend.Visible      := false;

  s.Labels.Fill.Color   := s.Fill.Color;
  s.Labels.Stroke.Color := s.Stroke.Color;

  s.Labels.Visible := True;
  s.XValues.MajorUnitFont.Size := 7;
  s.YValues.MajorUnitFont.Size := 10;
  s.XValues.MinorUnitFont.Size := 10;
  s.YValues.MinorUnitFont.Size := 7;
  s.XValues.MajorUnitFont.Color := gcDarkslategray;
  s.XValues.MajorUnitTickMarkColor := gcDarkslategray;
  s.YValues.MajorUnitFont.Color := gcDarkslategray;
  s.YValues.MajorUnitTickMarkColor := gcDarkslategray;

  while not dmDash.HIST_CONSUMO_MN.eof  do
  begin
     s.AddPoint(dmDash.HIST_CONSUMO_MN.FieldByName('value').AsFloat,
      dmDash.HIST_CONSUMO_MN.FieldByName('label').AsString);
    dmDash.HIST_CONSUMO_MN.Next;
  end;

  TMSFNCChart2.Title.Text         := 'Consumo MS';
  TMSFNCChart2.Title.Height       := 50;
  TMSFNCChart2.Title.TextHorizontalAlignment := gtaLeading;
  TMSFNCChart2.Title.Font.Color   := gcDarkslategray;
  TMSFNCChart2.Title.Stroke.Color := gcDarkslategray;
  TMSFNCChart2.Title.Font.Size    := 20;
  TMSFNCChart2.Title.Font.Style   := TMSFNCChart2.Title.Font.Style + [TFontStyle.fsBold];
  TMSFNCChart2.Legend.Visible     :=false;
  TMSFNCChart2.YAxis.Stroke.Color := gcDarkslategray;
  TMSFNCChart2.XAxis.Stroke.Color := gcDarkslategray;
  TMSFNCChart2.YAxis.Positions    := [ypLeft];
  TMSFNCChart2.XAxis.Positions    := [xpBottom];
  TMSFNCChart2.Stroke.Color       := gcDarkslategray;
  TMSFNCChart2.Fill.Color         := gcWhite;

  TMSFNCChart2.SeriesMargins.Left := 0;
  TMSFNCChart2.SeriesMargins.Top := 0;
  TMSFNCChart2.SeriesMargins.Right := 0;
  TMSFNCChart2.SeriesMargins.Bottom := 0;

    TMSFNCChart2.Series.Clear;
    s := TMSFNCChart2.Series.Add;
    s.YValues.Positions := [ypLeft];
    s.XValues.Positions := [xpBottom];
    s.XGrid.Visible := True;
    s.YGrid.Visible := True;
    s.XValues.Title.Font.Color := gcDarkslategray;
    s.XValues.Title.Font.Size := 5;
    s.XValues.Title.Font.Style := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
    s.XValues.Title.TextHorizontalAlignment := gtaTrailing;
    s.XValues.Title.TextMargins.Right := 10;

    s.YValues.Title.Font.Color := gcDarkslategray;
    s.YValues.Title.Font.Size := 10;
    s.YValues.Title.Font.Style := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
    s.YValues.Title.TextVerticalAlignment := gtaLeading;

    s.AutoXRange := arEnabled;
    s.AutoYRange := arEnabled;
    s.Mode       := smStatistical;
    s.ChartType := ctLine;

    s.Labels.Fill.Color   := s.Fill.Color;
    s.Labels.Stroke.Color := s.Stroke.Color;

    s.Labels.Visible := True;
    s.XValues.MajorUnitFont.Size := 7;
    s.YValues.MajorUnitFont.Size := 10;
    s.XValues.MinorUnitFont.Size := 7;
    s.YValues.MinorUnitFont.Size := 10;
    s.XValues.MajorUnitFont.Color := gcDarkslategray;
    s.XValues.MajorUnitTickMarkColor := gcDarkslategray;
    s.YValues.MajorUnitFont.Color := gcDarkslategray;
    s.YValues.MajorUnitTickMarkColor := gcDarkslategray;

    while not dmDash.HIST_CONSUMO_MS.eof  do
    begin
       s.AddPoint(dmDash.HIST_CONSUMO_MS.FieldByName('value').AsFloat,
       dmDash.HIST_CONSUMO_MS.FieldByName('label').AsString);
      dmDash.HIST_CONSUMO_MS.Next;
    end;


    TMSFNCChart3.Title.Text         := 'Consumo IMS %PV';
    TMSFNCChart3.Title.Height       := 50;
    TMSFNCChart3.Title.TextHorizontalAlignment := gtaLeading;
    TMSFNCChart3.Title.Font.Color   := gcDarkslategray;
    TMSFNCChart3.Title.Stroke.Color := gcDarkslategray;
    TMSFNCChart3.Title.Font.Size    := 20;
    TMSFNCChart3.Title.Font.Style   := TMSFNCChart3.Title.Font.Style + [TFontStyle.fsBold];
    TMSFNCChart3.Legend.Visible     := false;
    TMSFNCChart3.YAxis.Stroke.Color := gcDarkslategray;
    TMSFNCChart3.XAxis.Stroke.Color := gcDarkslategray;
    TMSFNCChart3.YAxis.Positions    := [ypLeft];
    TMSFNCChart3.XAxis.Positions    := [xpBottom];
    TMSFNCChart3.Stroke.Color       := gcDarkslategray;
    TMSFNCChart3.Fill.Color         := gcWhite;

    TMSFNCChart3.SeriesMargins.Left := 0;
    TMSFNCChart3.SeriesMargins.Top := 0;
    TMSFNCChart3.SeriesMargins.Right := 0;
    TMSFNCChart3.SeriesMargins.Bottom := 0;

    TMSFNCChart3.Series.Clear;
    s := TMSFNCChart3.Series.Add;
    s.YValues.Positions         := [ypLeft];
    s.XValues.Positions         := [xpBottom];
    s.XGrid.Visible             := True;
    s.YGrid.Visible             := True;
    s.XValues.Title.Font.Color  := gcDarkslategray;
    s.XValues.Title.Font.Size   := 5;
    s.XValues.Title.Font.Style  := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
    s.XValues.Title.TextHorizontalAlignment := gtaTrailing;
    s.XValues.Title.TextMargins.Right := 10;

    s.YValues.Title.Font.Color := gcDarkslategray;
    s.YValues.Title.Font.Size  := 10;
    s.YValues.Title.Font.Style := s.YValues.Title.Font.Style + [TFontStyle.fsBold];
    s.YValues.Title.TextVerticalAlignment := gtaLeading;

    s.AutoXRange := arEnabled;
    s.AutoYRange := arEnabled;
    s.Mode       := smStatistical;
    s.ChartType := ctLine;

    s.Labels.Fill.Color   := s.Fill.Color;
    s.Labels.Stroke.Color := s.Stroke.Color;

    s.Labels.Visible := True;
    s.XValues.MajorUnitFont.Size := 7;
    s.YValues.MajorUnitFont.Size := 10;
    s.XValues.MinorUnitFont.Size := 7;
    s.YValues.MinorUnitFont.Size := 10;
    s.XValues.MajorUnitFont.Color := gcDarkslategray;
    s.XValues.MajorUnitTickMarkColor := gcDarkslategray;
    s.YValues.MajorUnitFont.Color := gcDarkslategray;
    s.YValues.MajorUnitTickMarkColor := gcDarkslategray;

    while not dmDash.HIST_CONSUMO_IMSPV.eof  do
    begin
       s.AddPoint(dmDash.HIST_CONSUMO_IMSPV.FieldByName('value').AsFloat
        ,dmDash.HIST_CONSUMO_IMSPV.FieldByName('label').AsString);
      dmDash.HIST_CONSUMO_IMSPV.Next;
    end;
    LayCharts.Visible := true;
end;


procedure TfrmDashBoard.GeraCombo;
begin
  c := TCustomCombo.Create(frmDashBoard);
  c.TitleMenuText := 'Escolha uma Local';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemLoteClick;
  dmDash.AbreCurraisCombo;
  dmDash.CurraisCombo.First;
  while not dmDash.CurraisCombo.Eof do
  begin
    c.AddItem4(
     dmDash.CurraisCombo.FieldByName('ID_CURRAL').AsString,//cod
     dmDash.CurraisCombo.FieldByName('QTD_CAB').AsString,//descricao
     intToStr(dmDash.CurraisCombo.FieldByName('DIAS').AsInteger),//descricao2
     dmDash.CurraisCombo.FieldByName('CODIGO').AsString,//nome
     dmDash.CurraisCombo.FieldByName('MEDIA_PESO').Asfloat//descricao 1
    );
    dmDash.CurraisCombo.Next;
  end;
end;
{$IFDEF ANDROID}
procedure TfrmDashBoard.ItemLoteClick(Sender: TObject; const Point: TPointF);
begin
 c.HideMenu;
 lblCurral.Text        := c.NomeItem;
 vIdCurral             := c.CodItem;
 lblTotalAnimais.Text  := c.DescricaoItem;
 lblDiasMedio.Text     := c.DescricaoItem2;
 lblPesoMedio.Text     := Formatfloat('0.00',c.DescricaoItem1);
 GeraGrafico(vIdCurral);
end;
{$ENDIF}
{$IFDEF MSWINDOWS}
procedure TfrmDashBoard.ItemLoteClick(Sender: TObject);
begin
 c.HideMenu;
 lblCurral.Text        := c.NomeItem;
 vIdCurral             := c.CodItem;
 lblTotalAnimais.Text  := c.DescricaoItem;
 lblDiasMedio.Text     := c.DescricaoItem2;
 lblPesoMedio.Text     := Formatfloat('0.00',c.DescricaoItem1);
 WebBrowser2.Visible   := false;
 GeraGrafico(vIdCurral);
end;
{$ENDIF}

end.
