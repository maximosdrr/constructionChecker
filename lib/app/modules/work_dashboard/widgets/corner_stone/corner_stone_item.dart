import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:constructionChecker/models/corner_stone_avg.dart';
import 'package:constructionChecker/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CornerStoneAVGItem extends StatefulWidget {
  final ICornerStoneAvg cornerStoneAvg;
  CornerStoneAVGItem({Key key, @required this.cornerStoneAvg})
      : super(key: key);

  @override
  _CornerStoneAVGItemState createState() => _CornerStoneAVGItemState();
}

class _CornerStoneAVGItemState extends State<CornerStoneAVGItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.4,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                "Pilar: ${widget.cornerStoneAvg.cornerStone.name}",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: RatingBarIndicator(
                rating: widget.cornerStoneAvg.avg.value,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 50.0,
                direction: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Nota: ${widget.cornerStoneAvg.avg.value.toStringAsFixed(1)}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () async {
        final _workDashboardController = Modular.get<WorkDashboardController>();
        _workDashboardController.selectedCornerStoneAvg = widget.cornerStoneAvg;
        await Modular.to.pushNamed('/corner_stone_history');
      },
    );
  }
}
