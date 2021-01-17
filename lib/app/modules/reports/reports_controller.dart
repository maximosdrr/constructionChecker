import 'package:constructionChecker/models/report.dart';
import 'package:constructionChecker/services/pdf/pdf.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'reports_controller.g.dart';

@Injectable()
class ReportsController = _ReportsControllerBase with _$ReportsController;

abstract class _ReportsControllerBase with Store {
  final PdfService iPdfService;
  _ReportsControllerBase(this.iPdfService);

  @observable
  bool generated = false;

  @action
  generatePdf(IReport report) async {
    generated = await iPdfService.save(report);
  }
}
