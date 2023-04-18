program PecMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\UPrincipal\UPrincipal.pas' {frmPrincipal},
  UFLogin in '..\UPrincipal\Frames\UFLogin.pas' {frmeLogin: TFrame},
  UFConfig in '..\UPrincipal\Frames\UFConfig.pas' {frameConfig: TFrame},
  UDmDB in '..\dmDB\UDmDB.pas' {dmdb: TDataModule},
  UdmSync in '..\dmDB\UdmSync.pas' {dmSync: TDataModule},
  UFSync in '..\UPrincipal\Frames\UFSync.pas' {FrameSync: TFrame},
  UCurrais in '..\Currais\UCurrais.pas' {frmListaCurrais},
  UFrameLista in '..\Currais\UFrameLista.pas' {FItemListaCurrais: TFrame},
  UFrameListaAlimentos in '..\Alimentos\UFrameListaAlimentos.pas' {FItemListaAlimentos: TFrame},
  UListRaca in '..\RACA\UListRaca.pas' {frmListRaca},
  UFrameRaca in '..\RACA\UFrameRaca.pas' {FrameRaca: TFrame},
  UListCategoria in '..\Categoria\UListCategoria.pas' {frmListCategoria},
  UFrameCategoria in '..\Categoria\UFrameCategoria.pas' {FrameCategoria: TFrame},
  UListProdutores in '..\ListProdutores\UListProdutores.pas' {frmListProdutores},
  UFrameProdutores in '..\ListProdutores\UFrameProdutores.pas' {FrameProdutores: TFrame},
  UListRebanho in '..\ListRebanho\UListRebanho.pas' {frmListRebanho},
  UFrameRebanho in '..\ListRebanho\UFrameRebanho.pas' {FrameRebanho: TFrame},
  UFrameAnimal in '..\ListAnimal\UFrameAnimal.pas' {FrameAnimal: TFrame},
  UListAnimal in '..\ListAnimal\UListAnimal.pas' {frmListAnimal},
  UListBebedouro in '..\ListBebedouro\UListBebedouro.pas' {frmListBebedouro},
  UFrameBebedouro in '..\ListBebedouro\UFrameBebedouro.pas' {FrameBebedouro: TFrame},
  UListCocho in '..\ListCocho\UListCocho.pas' {frmListCocho},
  UFrameCocho in '..\ListCocho\UFrameCocho.pas' {FrameCocho: TFrame},
  ULimpaBebedouro in '..\LimpaBebedouro\ULimpaBebedouro.pas' {FrmLimpaBebedouro},
  UFrameLimpaBebedouro in '..\LimpaBebedouro\UFrameLimpaBebedouro.pas' {FrameLimpaBebedouro: TFrame},
  UdmSyncUp in '..\dmDB\UdmSyncUp.pas' {dmSyncUp: TDataModule},
  UMovAnimal in '..\MovimentacaoAnimal\UMovAnimal.pas' {frmMovAnimal},
  UFrameMovAnimal in '..\MovimentacaoAnimal\UFrameMovAnimal.pas' {FrameMovAnimal: TFrame},
  UListMotivoMov in '..\ListMotivoMovimentacao\UListMotivoMov.pas' {frmListaMotivoMov},
  UFrameMotivoMov in '..\ListMotivoMovimentacao\UFrameMotivoMov.pas' {FrameMotivoMov: TFrame},
  UListSuplementoMineral in '..\ListSuplementoMineral\UListSuplementoMineral.pas' {frmListaMineral},
  UFrameSuplementoMineral in '..\ListSuplementoMineral\UFrameSuplementoMineral.pas' {FrameSuplementoMineral: TFrame},
  UFornMineral in '..\FornecimentoMineral\UFornMineral.pas' {frmFornMineral},
  UFrameFormMineral in '..\FornecimentoMineral\UFrameFormMineral.pas' {FrameFornMineral: TFrame},
  ULeituraCocho in '..\LeituraDeCocho\ULeituraCocho.pas' {frmLeituraCocho},
  UFrameLeituraCocho in '..\LeituraDeCocho\UFrameLeituraCocho.pas' {FrameLeituraCocho: TFrame},
  UFrameLoteNutricional in '..\LoteNutricao\UFrameLoteNutricional.pas' {FItemListaLoteNutricional: TFrame},
  UFrameLoteLeitura in '..\LeituraDeCocho\UFrameLoteLeitura.pas' {FrameLoteLeitura: TFrame},
  uCombobox in '..\LeituraDeCocho\uCombobox.pas',
  UFabricacao in '..\Fabricacao\UFabricacao.pas' {frmFabricacao},
  UFrameFabricacao in '..\Fabricacao\UFrameFabricacao.pas' {FrameFabricacao: TFrame},
  uCbxFabricacao in '..\Fabricacao\uCbxFabricacao.pas',
  UFrameListaInsumos in '..\Fabricacao\UFrameListaInsumos.pas' {FrameListaInsumos: TFrame},
  UFornecimento in '..\FornecimentoConf\UFornecimento.pas' {frmFornecimento},
  UFrameFornecimento in '..\FornecimentoConf\UFrameFornecimento.pas' {FrameFornecimento: TFrame},
  UFrameLoteFornecimento in '..\FornecimentoConf\UFrameLoteFornecimento.pas' {FrameLoteFornecimento: TFrame},
  UTeclado in '..\Teclado\UTeclado.pas' {frmTeclado},
  UDMDashBoard in '..\dmDB\UDMDashBoard.pas' {dmDash: TDataModule},
  UDashBoard in '..\DashBoard\UDashBoard.pas' {frmDashBoard},
  UHistSanidade in '..\HistSanidade\UHistSanidade.pas' {frmHistSanidade},
  UNewCam in '..\Leitor\UNewCam.pas' {FrmCameraNew},
  UAlimento in '..\Alimentos\UAlimento.pas' {frmListaAlimentos},
  UFarmacos in '..\Farmacos\UFarmacos.pas' {frmFarmacos},
  uFormat in '..\Util\uFormat.pas',
  UProtocoloSanitario in '..\ProtocoloSanitario\UProtocoloSanitario.pas' {FrmProtocoloSanitario};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdmdb, dmdb);
  Application.CreateForm(TdmSync, dmSync);
  Application.CreateForm(TfrmListaCurrais, frmListaCurrais);
  Application.CreateForm(TfrmListRaca, frmListRaca);
  Application.CreateForm(TfrmListCategoria, frmListCategoria);
  Application.CreateForm(TfrmListProdutores, frmListProdutores);
  Application.CreateForm(TfrmListRebanho, frmListRebanho);
  Application.CreateForm(TfrmListAnimal, frmListAnimal);
  Application.CreateForm(TfrmListBebedouro, frmListBebedouro);
  Application.CreateForm(TfrmListCocho, frmListCocho);
  Application.CreateForm(TFrmLimpaBebedouro, FrmLimpaBebedouro);
  Application.CreateForm(TdmSyncUp, dmSyncUp);
  Application.CreateForm(TfrmMovAnimal, frmMovAnimal);
  Application.CreateForm(TfrmListaMotivoMov, frmListaMotivoMov);
  Application.CreateForm(TfrmListaMineral, frmListaMineral);
  Application.CreateForm(TfrmFornMineral, frmFornMineral);
  Application.CreateForm(TfrmLeituraCocho, frmLeituraCocho);
  Application.CreateForm(TfrmFabricacao, frmFabricacao);
  Application.CreateForm(TfrmFornecimento, frmFornecimento);
  Application.CreateForm(TfrmTeclado, frmTeclado);
  Application.CreateForm(TdmDash, dmDash);
  Application.CreateForm(TfrmDashBoard, frmDashBoard);
  Application.CreateForm(TfrmHistSanidade, frmHistSanidade);
  Application.CreateForm(TfrmHistSanidade, frmHistSanidade);
  Application.CreateForm(TFrmCameraNew, FrmCameraNew);
  Application.CreateForm(TfrmListaAlimentos, frmListaAlimentos);
  Application.CreateForm(TfrmFarmacos, frmFarmacos);
  Application.CreateForm(TFrmProtocoloSanitario, FrmProtocoloSanitario);
  Application.Run;
end.
