import 'dart:convert';

import 'package:constructionChecker/models/avg.dart';
import 'package:constructionChecker/models/cornerstone.dart';

class ICornerStoneAvg {
  ICornerStone cornerStone;
  IAvg avg;
  ICornerStoneAvg({
    this.cornerStone,
    this.avg,
  });

  ICornerStoneAvg copyWith({
    ICornerStone cornerStone,
    IAvg avg,
  }) {
    return ICornerStoneAvg(
      cornerStone: cornerStone ?? this.cornerStone,
      avg: avg ?? this.avg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cornerStone': cornerStone?.toMap(),
      'avg': avg?.toMap(),
    };
  }

  factory ICornerStoneAvg.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ICornerStoneAvg(
      cornerStone: ICornerStone.fromMap(map['cornerStone']),
      avg: IAvg.fromMap(map['avg']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ICornerStoneAvg.fromJson(String source) =>
      ICornerStoneAvg.fromMap(json.decode(source));

  @override
  String toString() => 'ICornerStoneAvg(cornerStone: $cornerStone, avg: $avg)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ICornerStoneAvg && o.cornerStone == cornerStone && o.avg == avg;
  }

  @override
  int get hashCode => cornerStone.hashCode ^ avg.hashCode;
}
