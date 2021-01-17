import 'dart:io';

import 'package:constructionChecker/models/report.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  save(IReport report) async {
    try {
      Directory downloadsDirectory =
          await DownloadsPathProvider.downloadsDirectory;
      final pdf = pw.Document();
      pdf.addPage(build(pdf, report));

      final file = File(
          "${downloadsDirectory.path}/relatorio_diario_${DateTime.now().millisecond}.pdf");
      await file.writeAsBytes(await pdf.save());
      return true;
    } catch (e) {
      return false;
    }
  }

  pw.Page build(pw.Document pdf, IReport report) {
    return pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          child: pw.Column(
            children: [
              pw.Container(
                child: pw.Text(
                  "Relatorio Diario de Obra",
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.Container(
                margin: pw.EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "JMRC ENGENHARIA",
                ),
              ),
              createKeyValueFild('Obra', report.obra),
              createKeyValueFild('Contratante', report.contratante),
              createKeyValueFild('Numero do Contrato', report.numeroContrato),
              createKeyValueFild('Prazo Contratual', report.prazoContratual),
              createKeyValueFild('Prazo Decorrido', report.prazoDecorrido),
              createKeyValueFild('Prazo a Vencer', report.prazoVencer),
              createKeyValueFild('Clima', report.clima),
              createKeyValueFild('Condição', report.condicao),
              createListView('Observações', report.observacoes),
            ],
          ),
        );
      },
    );
  }

  createListView(String label, List<String> list) {
    return pw.Column(
      children: [
        pw.Container(
          child: pw.Text(
            label,
            style: pw.TextStyle(
              fontSize: 22,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            return pw.Container(
              child: pw.Column(
                children: [
                  pw.Text(
                    list[i],
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                  pw.Text("\n"),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  createKeyValueFild(String key, String value) {
    return pw.Container(
      padding: pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(
          width: 1,
        ),
      ),
      child: pw.Column(
        children: [
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              key,
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              value,
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
