import 'dart:convert';

class ICheckList {
  int id;
  int percentageCompleted;
  int workId;
  String description;
  String payAtention;
  String step;
  ICheckList({
    this.id,
    this.percentageCompleted,
    this.workId,
    this.description,
    this.payAtention,
    this.step,
  });

  ICheckList copyWith({
    int id,
    int percentageCompleted,
    int workId,
    String description,
    String payAtention,
    String step,
  }) {
    return ICheckList(
      id: id ?? this.id,
      percentageCompleted: percentageCompleted ?? this.percentageCompleted,
      workId: workId ?? this.workId,
      description: description ?? this.description,
      payAtention: payAtention ?? this.payAtention,
      step: step ?? this.step,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'percentageCompleted': percentageCompleted,
      'workId': workId,
      'description': description,
      'payAtention': payAtention,
      'step': step,
    };
  }

  factory ICheckList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ICheckList(
      id: map['id'],
      percentageCompleted: map['percentageCompleted'],
      workId: map['workId'],
      description: map['description'],
      payAtention: map['payAtention'],
      step: map['step'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ICheckList.fromJson(String source) =>
      ICheckList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ICheckList(id: $id, percentageCompleted: $percentageCompleted, workId: $workId, description: $description, payAtention: $payAtention, step: $step)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ICheckList &&
        o.id == id &&
        o.percentageCompleted == percentageCompleted &&
        o.workId == workId &&
        o.description == description &&
        o.payAtention == payAtention &&
        o.step == step;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        percentageCompleted.hashCode ^
        workId.hashCode ^
        description.hashCode ^
        payAtention.hashCode ^
        step.hashCode;
  }
}
