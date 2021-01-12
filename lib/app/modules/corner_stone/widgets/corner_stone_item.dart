import 'package:constructionChecker/app/modules/corner_stone/widgets/delete_corner_stone_dialog.dart';
import 'package:constructionChecker/app/modules/corner_stone/widgets/edit_corner_dialog.dart';
import 'package:constructionChecker/models/cornerstone.dart';
import 'package:flutter/material.dart';

class CornerStoneItem extends StatelessWidget {
  final ICornerStone cornerStone;
  CornerStoneItem({Key key, this.cornerStone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          cornerStone.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => EditCornerStoneDialog(
                    cornerStone: cornerStone,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => DeleteCornerStoneDialog(
                    cornerStoneId: cornerStone.id,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
