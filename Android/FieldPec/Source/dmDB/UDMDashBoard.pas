unit UDMDashBoard;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmDash = class(TDataModule)
    qryAux: TFDQuery;
    AnimalCategoria: TFDQuery;
    AnimalRaca: TFDQuery;
    AnimalRebanho: TFDQuery;
    qtdCabLocal: TFDQuery;
    CurraisCombo: TFDQuery;
    HIST_CONSUMO_MN: TFDQuery;
    HIST_CONSUMO_MS: TFDQuery;
    HIST_CONSUMO_IMSPV: TFDQuery;
    FornePrevisto: TFDQuery;
    ForneRealizado: TFDQuery;
    FabricadoXForne: TFDQuery;
    ForneRealizadoGeral: TFDQuery;
  private
    { Private declarations }
  public
    procedure GeraResumo;
    procedure AbreCurraisCombo;
    procedure AbreHistConsumo(vIdLocal: string);
    procedure AbrePrevistoRealizado(vData,vIdRacao,vLinha,vTrato:string);
  end;

var
  dmDash: TdmDash;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDmDB, UDashBoard;

{$R *.dfm}

{ TDataModule1 }

procedure TdmDash.AbreCurraisCombo;
begin
 with CurraisCombo,CurraisCombo.SQL do
 begin
   Clear;
   Add('SELECT C.ID ID_CURRAL,C.CODIGO,COUNT(*) QTD_CAB,AVG(PESO_ENTRADA) MEDIA_PESO,');
   Add('avg(Dias) Dias');
   Add('FROM ANIMAL A');
   Add('JOIN CURRAIS c ON c.ID=A.ID_LOCAL and TIPO=1');
   Add('WHERE A.ID_PROPRIEDADE='+dmdb.vIdPropriedade);
   Add('GROUP BY C.ID,C.CODIGO');
   Add('ORDER BY C.CODIGO');
   Open;
 end;
end;

procedure TdmDash.AbreHistConsumo(vIdLocal: string);
begin
 with HIST_CONSUMO_MN,HIST_CONSUMO_MN.SQL do
 begin
   Clear;
   Add('select DATA_CONSUMO "LABEL",MN "VALUE" from HIST_CONSUMO WHERE ID_CURRAL='+vIdLocal);
   Open;
 end;
 with HIST_CONSUMO_MS,HIST_CONSUMO_MS.SQL do
 begin
   Clear;
   Add('select DATA_CONSUMO "LABEL",MS "VALUE" from HIST_CONSUMO WHERE ID_CURRAL='+vIdLocal);
   Open;
 end;
 with HIST_CONSUMO_IMSPV,HIST_CONSUMO_IMSPV.SQL do
 begin
   Clear;
   Add('select DATA_CONSUMO "LABEL",IMSPV "VALUE" from HIST_CONSUMO WHERE ID_CURRAL='+vIdLocal);
   Open;
 end;
end;

procedure TdmDash.AbrePrevistoRealizado(vData, vIdRacao, vLinha,
  vTrato: string);
begin
   with FornePrevisto,FornePrevisto.SQL do
  begin
    Clear;
    Add('SELECT');
    Add(' B.NOME "Label",');
    Add(' SUM(COALESCE(A.PREVISTO_MN_KG,0)) "Value"');
    Add('FROM FORNECIMENTO_CONF A');
    Add('JOIN RACAO B ON A.ID_RACAO=B.ID');
    Add('JOIN currais C ON A.ID_LOCAL=C.ID');
    Add('WHERE DATA_FORN=:DATA_FORN');
    if vIdRacao.Length>0 then
     Add(' AND B.ID='+vIdRacao);
    if vLinha.Length>0 then
     Add(' and substr(C.CODIGO,1 ,(INSTR(C.CODIGO,''-'')-1)) like '+vLinha);
    if vTrato.Length>0 then
     Add(' and A.TRATO'+vTrato);
    Add('GROUP BY B.NOME');
    ParamByName('DATA_FORN').AsDate := StrToDate(vData);
    Open;
  end;
  with ForneRealizado,ForneRealizado.SQL do
  begin
    Clear;
    Add('SELECT');
    Add(' B.NOME "Label",');
    Add(' COALESCE(SUM(COALESCE(A.REALIZADO_MN_KG,0)),0) "Value"');
    Add('FROM FORNECIMENTO_CONF A');
    Add('JOIN RACAO B ON A.ID_RACAO=B.ID');
    Add('JOIN currais C ON A.ID_LOCAL=C.ID');
    Add('WHERE DATA_FORN=:DATA_FORN'); //'CURRENT_DATE
    if vIdRacao.Length>0 then
     Add(' AND B.ID='+vIdRacao);
    if vLinha.Length>0 then
     Add(' and substr(C.CODIGO,1 ,(INSTR(C.CODIGO,''-'')-1)) like '+vLinha);
    if vTrato.Length>0 then
     Add(' and A.TRATO'+vTrato);
    Add('GROUP BY B.NOME');
    ParamByName('DATA_FORN').AsDate := StrToDate(vData);
    Open;
  end;

  with ForneRealizadoGeral,ForneRealizadoGeral.SQL do
  begin
    Clear;
    Add('SELECT');
    Add(' B.NOME "Label",');
    Add(' SUM(COALESCE(A.PREVISTO_MN_KG,0)) "Value"');
    Add('FROM FORNECIMENTO_CONF A');
    Add('JOIN RACAO B ON A.ID_RACAO=B.ID');
    Add('JOIN currais C ON A.ID_LOCAL=C.ID');
    Add('WHERE DATA_FORN=:DATA_FORN'); //'CURRENT_DATE
    if vIdRacao.Length>0 then
     Add(' AND B.ID='+vIdRacao);
    Add('GROUP BY B.NOME');
    ParamByName('DATA_FORN').AsDate := StrToDate(vData);
    Open;
  end;

  with FabricadoXForne,FabricadoXForne.SQL do
  begin
    Clear;
    Add('select b.nome "Label",COALESCE(sum(COALESCE(kg_realizado,0)),0) "Value" from racao b');
    Add('left join fabricacao a on a.IDRACAO=b.id');
    Add('join FORNECIMENTO_CONF f on f.ID_RACAO=b.id');
    Add('where a.data_fab=:DATA_FORN');
    if vIdRacao.Length>0 then
     Add(' AND B.ID='+vIdRacao);
    Add('GROUP BY B.NOME');
    ParamByName('DATA_FORN').AsDate := StrToDate(vData);
    Open;
    FabricadoXForne.RecordCount;
  end;
end;

procedure TdmDash.GeraResumo;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select count(*) qtde from ANIMAL');
   Add('where id_propriedade='+dmdb.vIdPropriedade);
   Open;
   frmDashBoard.lbldashTotalAni.Text := FieldByName('qtde').AsString;

   Clear;
   Add('select avg(coalesce(a.PESO_ESTIMADO,a.PESO_ENTRADA,0)) PESO from ANIMAL a');
   Add('where a.id_propriedade='+dmdb.vIdPropriedade);
   Open;
   frmDashBoard.lblDashPesoMed.Text := FormatFloat('0.00',FieldByName('PESO').AsFloat);

   Clear;
   Add('select COUNT(*)QTD from ANIMAL a');
   Add('join CATEGORIAS b on a.ID_CATEGORIA=b.ID');
   Add('where a.id_propriedade='+dmdb.vIdPropriedade);
   Add('and b.SEXO=''M''');
   Open;
   frmDashBoard.lblPastoMacho.Text := FieldByName('QTD').AsString;

   Clear;
   Add('select COUNT(*)QTD from ANIMAL a');
   Add('join CATEGORIAS b on a.ID_CATEGORIA=b.ID');
   Add('where a.id_propriedade='+dmdb.vIdPropriedade);
   Add('and b.SEXO=''F''');
   Open;
   frmDashBoard.lblPastoFemea.Text := FieldByName('QTD').AsString;
 end;
 with AnimalCategoria,AnimalCategoria.SQL do
 begin
   Clear;
   Add('select b.NOME label,count(*) value from ANIMAL a');
   Add('join CATEGORIAS b on a.ID_CATEGORIA=b.ID');
   Add('where a.id_propriedade='+dmdb.vIdPropriedade);
   Add('group by b.NOME');
   Open;
 end;

 with AnimalRaca,AnimalRaca.SQL do
 begin
   Clear;
   Add('select b.NOME label,count(*) value from ANIMAL a');
   Add('join RACA b on a.ID_raca=b.ID');
   Add('where a.id_propriedade='+dmdb.vIdPropriedade);
   Add('group by b.NOME');
   Open;
 end;

 with AnimalRebanho,AnimalRebanho.SQL do
 begin
   Clear;
   Add('select b.NOME label,count(*) value from ANIMAL a');
   Add('join AUX_REBANHO b on a.ID_REBANHO=b.ID');
   Add('where a.id_propriedade='+dmdb.vIdPropriedade);
   Add('group by b.NOME');
   Open;
 end;

 with qtdCabLocal,qtdCabLocal.SQL do
 begin
   Clear;
   Add('select b.CODIGO label,count(*) value from ANIMAL a');
   Add('join CURRAIS b on a.ID_LOCAL=b.id');
   Add('group by b.CODIGO');
   Open;
 end;

end;


end.
