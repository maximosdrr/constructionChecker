import 'package:constructionChecker/models/report.dart';
import 'package:constructionChecker/services/pdf/pdf.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'reports_controller.g.dart';

@Injectable()
class ReportsController = _ReportsControllerBase with _$ReportsController;

abstract class _ReportsControllerBase with Store {
  final PdfService iPdfService;
  _ReportsControllerBase(this.iPdfService) {
    reportToPrint = IReport(
      obra: '',
      numeroContrato: '',
      numeroRdo: '',
      contratante: '',
      local: '',
      prazoContratual: '',
      prazoDecorrido: '',
      prazoVencer: '',
      clima: '',
      condicao: '',
      comentarios: '',
      observacoes: '',
      data: DateTime.now(),
      fotosAdicionadas: [],
      maoDeObra: [],
      materiaisRecebidos: [],
      status: [],
    );
  }

  @observable
  bool generated = false;

  @observable
  IReport reportToPrint;

  @observable
  ObservableList<MaoDeObra> maoDeObra = ObservableList();

  @observable
  ObservableList<Status> status = ObservableList();

  @observable
  ObservableList<String> materiaisRecebidos = ObservableList();

  @observable
  ObservableList<FotoAdicionada> imagensAdicionadas = ObservableList();

  @action
  generatePdf(IReport report) async {
    generated = await iPdfService.save(report);
  }

  @action
  finish() async {
    reportToPrint.fotosAdicionadas = imagensAdicionadas;
    reportToPrint.maoDeObra = maoDeObra;
    reportToPrint.status = status;
    reportToPrint.materiaisRecebidos = materiaisRecebidos;

    generated = await iPdfService.save(reportToPrint);
  }

  @action
  addPhoto(FotoAdicionada fotoAdicionada) {
    imagensAdicionadas.add(fotoAdicionada);
  }
}
