import 'dart:io';

import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/services/progression_pdf/progression_utils.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pw;

class ProgressionPdfService {
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

  save(List<ICheckList> checkLists, IWork work, File logoFile) async {
    try {
      await _permissionHandler();
      String downloadsDirectory = await _getPathToDownload();
      String docId = DateTime.now().millisecond.toString();

      final pdf = pw.Document();
      final logo = await generateLogo(logoFile);
      build(pdf, checkLists, work, logo);

      File('$downloadsDirectory/relatorio_de_progressao_$docId.pdf')
          .writeAsBytes(await pdf.save());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  build(
      pw.Document pdf, List<ICheckList> checkLists, IWork work, pw.Image logo) {
    pdf.addPage(
      pw.MultiPage(
        maxPages: 100,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            generateHeader(work, logo),
            pw.Container(
              alignment: pw.Alignment.center,
              margin: pw.EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: pw.Text(
                'Lista de Serviços',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            generateCheckList(checkLists),
            generateStats(checkLists),
          ];
        },
      ),
    );
  }

  pw.Column generateHeader(IWork work, pw.Image logo) {
    return pw.Column(
      children: [
        pw.Container(
          margin: pw.EdgeInsets.only(
            bottom: 30,
          ),
          child: pw.Text(
            'Gestão de serviços',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: 26,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          alignment: pw.Alignment.center,
          margin: pw.EdgeInsets.only(top: 0, bottom: 30),
          child: logo,
        ),
        pw.Container(
          alignment: pw.Alignment.topLeft,
          margin: pw.EdgeInsets.only(
            bottom: 15,
          ),
          child: pw.Text(
            'Relator: Jhonatan Mike R. Cordeiro',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          alignment: pw.Alignment.topLeft,
          margin: pw.EdgeInsets.only(
            bottom: 15,
          ),
          child: pw.Text(
            'Obra: ${work.name}',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          alignment: pw.Alignment.topLeft,
          margin: pw.EdgeInsets.only(
            bottom: 15,
          ),
          child: pw.Text(
            'Cliente: ${work.client}',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          alignment: pw.Alignment.topLeft,
          margin: pw.EdgeInsets.only(
            bottom: 15,
          ),
          child: pw.Text(
            'Área construida: ${work.constructionArea}',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  pw.Column generateCheckList(List<ICheckList> checkLists) {
    List<pw.Container> result = [];
    for (var checkList in checkLists) {
      var generated = generateCheckListItem(checkList);
      result.add(generated);
    }

    return pw.Column(children: result);
  }

  generateCheckListItem(ICheckList checkList) {
    return pw.Container(
      padding: pw.EdgeInsets.all(15),
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
              "Descrição: ${checkList.description}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Etapa: ${checkList.step}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Porcentagem de Execução: ${checkList.percentageCompleted}%",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Concluído: ${checkList.percentageCompleted == 100 ? 'Sim' : 'Não'}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  pw.Container generateStats(List<ICheckList> checkLists) {
    List<pw.Container> stats = [];
    var progressionUtils = ProgressionUtils();
    var totalAvg = progressionUtils.calculateTotalProgressionAVG(checkLists);
    var avgByStep = progressionUtils.calculateProgressionByStep(checkLists);

    stats.add(
      pw.Container(
        margin: pw.EdgeInsets.only(top: 30, bottom: 30),
        alignment: pw.Alignment.center,
        child: pw.Text(
          "Progressão da Obra",
          style: pw.TextStyle(
            fontSize: 22,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ),
    );

    for (var key in avgByStep.keys) {
      stats.add(
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              width: 2,
            ),
          ),
          alignment: pw.Alignment.topLeft,
          padding: pw.EdgeInsets.all(5),
          child: pw.Text(
            "${avgByStep[key]['step']}: ${avgByStep[key]['avg']}%",
            style: pw.TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    stats.add(
      pw.Container(
        margin: pw.EdgeInsets.only(top: 20),
        alignment: pw.Alignment.topLeft,
        child: pw.Text(
          "Progressão Total: $totalAvg %",
          style: pw.TextStyle(
            fontSize: 22,
            // fontWeight: pw.FontWeight.bold,
          ),
        ),
      ),
    );

    stats.add(
      pw.Container(
        margin: pw.EdgeInsets.only(top: 5),
        alignment: pw.Alignment.topLeft,
        child: pw.Text(
          "Progressão a Concluir: ${100 - double.parse(totalAvg)} %",
          style: pw.TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );

    return pw.Container(
      child: pw.Column(
        children: stats,
      ),
    );
  }

  Future<pw.Image> generateLogo(File logo) async {
    final image = pw.MemoryImage(
      logo.readAsBytesSync(),
    );

    return pw.Image(image, width: 200, height: 150);
  }
}
