import 'package:constructionChecker/app/modules/material_requirement/material_requirement_controller.dart';
import 'package:constructionChecker/models/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MaterialListItem extends StatelessWidget {
  final IMaterial material;
  final int index;
  MaterialListItem({
    Key key,
    @required this.material,
    @required this.index,
  }) : super(key: key);
  final _controller = Modular.get<MaterialRequirementController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        border: Border.all(
          width: 0.5,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          "Nome: ${material.name}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Container(
          margin: EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Quantidade: ${material.quantity} - ${material.unity}",
                  style: subtitleStyle(),
                ),
              ),
              Container(
                child: Text(
                  "Etapa: ${material.step}",
                  style: subtitleStyle(),
                ),
              ),
              Container(
                child: Text(
                  "Status: ${material.status}",
                  style: subtitleStyle(),
                ),
              ),
              Container(
                child: Text(
                  "Marca: ${material.brand}",
                  style: subtitleStyle(),
                ),
              ),
              Container(
                child: Text(
                  "Observações: ${material.observation}",
                  style: subtitleStyle(),
                ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.red,
          ),
          onPressed: () {
            _controller.removeMaterial(index);
          },
        ),
      ),
    );
  }

  TextStyle subtitleStyle() {
    return TextStyle(
      fontSize: 16,
    );
  }
}
