import 'dart:convert';

class ICornerStone {
  int id;
  String name;
  ICornerStone({
    this.id,
    this.name,
  });

  ICornerStone copyWith({
    int id,
    String name,
  }) {
    return ICornerStone(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ICornerStone.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ICornerStone(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ICornerStone.fromJson(String source) =>
      ICornerStone.fromMap(json.decode(source));

  @override
  String toString() => 'ICornerStone(id: $id, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ICornerStone && o.id == id && o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
