import 'dart:convert';

class IWorkCornerStone {
  int id;
  int workId;
  int cornerStoneId;
  double grade;
  DateTime savedAt;
  IWorkCornerStone({
    this.id,
    this.workId,
    this.cornerStoneId,
    this.grade,
    this.savedAt,
  });

  IWorkCornerStone copyWith({
    int id,
    int workId,
    int cornerStoneId,
    double grade,
    DateTime savedAt,
  }) {
    return IWorkCornerStone(
      id: id ?? this.id,
      workId: workId ?? this.workId,
      cornerStoneId: cornerStoneId ?? this.cornerStoneId,
      grade: grade ?? this.grade,
      savedAt: savedAt ?? this.savedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'workId': workId,
      'cornerStoneId': cornerStoneId,
      'grade': grade,
      'savedAt': savedAt?.millisecondsSinceEpoch,
    };
  }

  factory IWorkCornerStone.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return IWorkCornerStone(
      id: map['id'],
      workId: map['workId'],
      cornerStoneId: map['cornerStoneId'],
      grade: map['grade'],
      savedAt: DateTime.fromMillisecondsSinceEpoch(map['savedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory IWorkCornerStone.fromJson(String source) =>
      IWorkCornerStone.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IWorkCornerStone(id: $id, workId: $workId, cornerStoneId: $cornerStoneId, grade: $grade, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IWorkCornerStone &&
        o.id == id &&
        o.workId == workId &&
        o.cornerStoneId == cornerStoneId &&
        o.grade == grade &&
        o.savedAt == savedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        workId.hashCode ^
        cornerStoneId.hashCode ^
        grade.hashCode ^
        savedAt.hashCode;
  }
}
