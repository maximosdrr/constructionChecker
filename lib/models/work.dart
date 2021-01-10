import 'dart:convert';

class IWork {
  int id;
  DateTime initDate;
  String name;
  String client;
  String constructionArea;
  String artNumber;
  IWork({
    this.id,
    this.initDate,
    this.name,
    this.client,
    this.constructionArea,
    this.artNumber,
  });

  IWork copyWith({
    int id,
    DateTime initDate,
    String name,
    String client,
    String constructionArea,
    String artNumber,
  }) {
    return IWork(
      id: id ?? this.id,
      initDate: initDate ?? this.initDate,
      name: name ?? this.name,
      client: client ?? this.client,
      constructionArea: constructionArea ?? this.constructionArea,
      artNumber: artNumber ?? this.artNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'initDate': initDate?.millisecondsSinceEpoch,
      'name': name,
      'client': client,
      'constructionArea': constructionArea,
      'artNumber': artNumber,
    };
  }

  factory IWork.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return IWork(
      id: map['id'],
      initDate: DateTime.fromMillisecondsSinceEpoch(map['initDate']),
      name: map['name'],
      client: map['client'],
      constructionArea: map['constructionArea'],
      artNumber: map['artNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IWork.fromJson(String source) => IWork.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IWork(id: $id, initDate: $initDate, name: $name, client: $client, constructionArea: $constructionArea, artNumber: $artNumber)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IWork &&
        o.id == id &&
        o.initDate == initDate &&
        o.name == name &&
        o.client == client &&
        o.constructionArea == constructionArea &&
        o.artNumber == artNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        initDate.hashCode ^
        name.hashCode ^
        client.hashCode ^
        constructionArea.hashCode ^
        artNumber.hashCode;
  }
}
