import 'dart:io';

import 'package:constructionChecker/models/material.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pw;

class MaterialRequirementPdfService {
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

  save(List<IMaterial> materials, String workName, String clientName,
      File logoFile) async {
    try {
      await _permissionHandler();
      String downloadsDirectory = await _getPathToDownload();
      String docId = DateTime.now().millisecond.toString();

      final pdf = pw.Document();
      final logo = await generateLogo(logoFile);
      build(pdf, materials, logo, workName, clientName);

      File('$downloadsDirectory/requerimento_de_material_$docId.pdf')
          .writeAsBytes(await pdf.save());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  build(
    pw.Document pdf,
    List<IMaterial> materials,
    pw.Image logo,
    String workName,
    String clientName,
  ) {
    pdf.addPage(
      pw.MultiPage(
        maxPages: 100,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            generateHeader(workName, clientName, logo),
            pw.Container(
              alignment: pw.Alignment.center,
              margin: pw.EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: pw.Text(
                'Materiais Requeridos',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            generateMaterialList(materials),
          ];
        },
      ),
    );
  }

  pw.Column generateMaterialList(List<IMaterial> materialItem) {
    List<pw.Container> result = [];
    for (var checkList in materialItem) {
      var generated = generateMaterialListItem(checkList);
      result.add(generated);
    }

    return pw.Column(children: result);
  }

  generateMaterialListItem(IMaterial materialItem) {
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
              "Material: ${materialItem.name}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Etapa: ${materialItem.step}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Quantidade: ${materialItem.quantity} ${materialItem.unity}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Status: ${materialItem.status}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Marca: ${materialItem.brand}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text(
              "Observações: ${materialItem.observation}",
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  pw.Column generateHeader(String workName, String clientName, pw.Image logo) {
    return pw.Column(
      children: [
        pw.Container(
          margin: pw.EdgeInsets.only(
            bottom: 30,
          ),
          child: pw.Text(
            'Requerimento de Materiais',
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
            'Obra: $workName',
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
            'Cliente: $clientName',
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

  Future<pw.Image> generateLogo(File logo) async {
    final image = pw.MemoryImage(
      logo.readAsBytesSync(),
    );

    return pw.Image(image, width: 200, height: 150);
  }
}
