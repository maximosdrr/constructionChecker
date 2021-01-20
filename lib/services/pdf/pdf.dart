import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:constructionChecker/models/report.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfService {
  Future<String> _getPathToDownload() async {
    return ExtStorage.getExternalStoragePublicDirectory(
      ExtStorage.DIRECTORY_DOWNLOADS,
    );
  }

  Future _permissionHandler() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  save(IReport report) async {
    try {
      await _permissionHandler();
      String downloadsDirectory = await _getPathToDownload();
      String docId = DateTime.now().millisecond.toString();

      final pdf = pw.Document();

      build(pdf, report);

      File('$downloadsDirectory/relatorio$docId.pdf')
          .writeAsBytes(await pdf.save());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  build(pw.Document pdf, IReport report) {
    pdf.addPage(
      pw.MultiPage(
        maxPages: 100,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Column(
              children: [
                pw.Container(
                  margin: pw.EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: pw.Text(
                    'Relatorio da Obra',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 26,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.topLeft,
                  margin: pw.EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: pw.Text(
                    'Jhonatan Mike R. Cordeiro',
                    textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                generateLabelText('Obra', report.obra),
                generateLabelText('Contratante', report.contratante),
                generateLabelText('Nº Contrato', report.numeroContrato),
                generateLabelText('Nº RDO', report.numeroRdo),
                generateLabelText('Prazo Contratual', report.prazoContratual),
                generateLabelText('Prazo Decorrido', report.prazoDecorrido),
                generateLabelText('Prazo a Vencer', report.prazoVencer),
                generateLabelText(
                  'Data',
                  formatDate(report.data, [dd, '/', mm, '/', yyyy]),
                ),
                generateLabelText('Clima', report.clima),
                generateLabelText('Condição', report.condicao),
                generateLabelText('Comentarios', report.comentarios),
                generateLabelText('Observações', report.observacoes),
              ],
            ),
            pw.Container(
              alignment: pw.Alignment.topLeft,
              margin: pw.EdgeInsets.only(
                bottom: 20,
                top: 20,
              ),
              child: pw.Text(
                "Mão de Obra",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            generateMaoDeObra(report.maoDeObra),
            pw.Container(
              alignment: pw.Alignment.topLeft,
              margin: pw.EdgeInsets.only(
                bottom: 20,
                top: 20,
              ),
              child: pw.Text(
                "Andamento da Obra",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            generateStatus(report.status),
            pw.Container(
              alignment: pw.Alignment.topLeft,
              margin: pw.EdgeInsets.only(
                bottom: 20,
                top: 20,
              ),
              child: pw.Text(
                "Materiais Recebidos",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            generateMaterialRecebido(report.materiaisRecebidos),
            generateAddedImages(report),
          ];
        },
      ),
    );
  }

  pw.Column generateMaterialRecebido(List<String> materiaisRecebidos) {
    List<pw.Container> containers = [];
    for (var material in materiaisRecebidos) {
      containers.add(
        pw.Container(
          padding: pw.EdgeInsets.all(20),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              width: 2,
            ),
          ),
          child: pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Material: ${material}",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return pw.Column(children: containers);
  }

  pw.Column generateStatus(List<Status> status) {
    List<pw.Container> containers = [];
    for (var statu in status) {
      containers.add(
        pw.Container(
          padding: pw.EdgeInsets.all(20),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              width: 2,
            ),
          ),
          child: pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Andar: ${statu.andar}",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Descrição: ${statu.description}",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Execução: ${statu.porcentagemDeExecucao}%",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Status: ${statu.status}",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return pw.Column(children: containers);
  }

  pw.Column generateMaoDeObra(List<MaoDeObra> maoDeObras) {
    List<pw.Container> containers = [];
    for (var maoDeObra in maoDeObras) {
      containers.add(
        pw.Container(
          padding: pw.EdgeInsets.all(20),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              width: 2,
            ),
          ),
          child: pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Descrição: ${maoDeObra.descricao}",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Categoria: ${maoDeObra.categoria}",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Quantidade: ${maoDeObra.quantidade}",
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return pw.Column(children: containers);
  }

  pw.Container generateLabelText(String label, String text) {
    return pw.Container(
      padding: pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(
          width: 2,
        ),
      ),
      child: pw.Column(
        children: [
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              label,
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              text,
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  pw.Column generateAddedImages(IReport report) {
    List<pw.Widget> images = [];
    print(report.fotosAdicionadas.length);
    for (var addedImage in report.fotosAdicionadas) {
      final image = pw.MemoryImage(
        addedImage.imagem.readAsBytesSync(),
      );

      // pw.RawImage(bytes: decodeUin)
      var imageColumn = pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            margin: pw.EdgeInsets.all(30),
            alignment: pw.Alignment.center,
            child: pw.Image(
              image,
              fit: pw.BoxFit.fill,
              width: 450,
              height: 500,
            ),
          ),
          pw.Container(
            child: pw.Text(
              addedImage.descricao,
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      );
      images.add(imageColumn);
    }

    return pw.Column(
      children: images,
    );
  }
}
