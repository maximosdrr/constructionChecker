import 'package:constructionChecker/models/check_list.dart';

class ProgressionUtils {
  String calculateTotalProgressionAVG(List<ICheckList> checkLists) {
    double avg = 0;

    for (var checkList in checkLists) {
      avg += checkList.percentageCompleted;
    }

    print('TOTAL: $avg, Tamanho do CheckList: ${checkLists.length}');

    return (avg / checkLists.length).toStringAsFixed(2);
  }

  Map<String, dynamic> calculateProgressionByStep(List<ICheckList> checkLists) {
    var stepObjects = Map<String, dynamic>();
    var stepObjectsAVG = Map<String, dynamic>();

    for (var checkList in checkLists) {
      if (stepObjects.containsKey(checkList.step)) {
        stepObjects[checkList.step]['totalProgression'] +=
            checkList.percentageCompleted;
        stepObjects[checkList.step]['totalItens'] += 1;
      } else {
        stepObjects[checkList.step] = {
          'totalProgression': checkList.percentageCompleted,
          'totalItens': 1,
          'step': checkList.step,
        };
      }
    }

    // print(stepObjects);

    for (var key in stepObjects.keys) {
      stepObjectsAVG[key] = {
        'step': stepObjects[key]['step'],
        'avg': (stepObjects[key]['totalProgression'] /
                stepObjects[key]['totalItens'])
            .toStringAsFixed(2)
      };
    }

    return stepObjectsAVG;
  }
}
