import 'package:constructionChecker/models/work_corner_stone.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'delete_corner_stone_dialog.dart';

class CornerStoneHistoryItem extends StatelessWidget {
  final IWorkCornerStone cornerStone;
  const CornerStoneHistoryItem({Key key, this.cornerStone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Data da Avaliação: ${formatDate(cornerStone.savedAt, [
        dd,
        '/',
        mm,
        '/',
        yyyy
      ])}"),
      subtitle: Container(
        margin: EdgeInsets.only(
          top: 3,
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: RatingBarIndicator(
                rating: cornerStone.grade,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                cornerStone.grade.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.close),
        color: Colors.red,
        onPressed: () => showDialog(
          context: context,
          builder: (_) => DeleterHistoryCornerStoneDialog(
            cornerStoneHistoryId: this.cornerStone.id,
          ),
        ),
      ),
    );
  }
}
