import 'dart:io';

import 'package:constructionChecker/models/report.dart';
import 'package:constructionChecker/services/report_pdf/pdf.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<File> getImage() async {
    try {
      File _image;
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      _image = File(pickedFile.path);
      return _image;
    } catch (e) {
      return null;
    }
  }

  @action
  finish() async {
    try {
      if (reportToPrint.prazoVencer == null ||
          reportToPrint.prazoVencer == '') {
        reportToPrint.prazoVencer = (int.parse(reportToPrint.prazoContratual) -
                int.parse(reportToPrint.prazoDecorrido))
            .toString();
      } else {
        reportToPrint.prazoVencer = reportToPrint.prazoVencer;
      }
    } catch (e) {
      print(e);
      reportToPrint.prazoVencer = 0.toString();
    }
    reportToPrint.fotosAdicionadas = imagensAdicionadas;
    reportToPrint.maoDeObra = maoDeObra;
    reportToPrint.status = status;
    reportToPrint.materiaisRecebidos = materiaisRecebidos;

    File logo = await getImage();
    if (logo != null) {
      generated = await iPdfService.save(reportToPrint, logo);
    }
  }

  @action
  addPhoto(FotoAdicionada fotoAdicionada) {
    imagensAdicionadas.add(fotoAdicionada);
  }
}
