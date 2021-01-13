import 'dart:convert';

class IAvg {
  double value;
  IAvg({
    this.value,
  });

  IAvg copyWith({
    double value,
  }) {
    return IAvg(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory IAvg.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return IAvg(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IAvg.fromJson(String source) => IAvg.fromMap(json.decode(source));

  @override
  String toString() => 'IAvg(value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IAvg && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
