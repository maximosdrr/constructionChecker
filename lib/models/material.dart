import 'dart:convert';

class IMaterial {
  String name;
  String step;
  String unity;
  String quantity;
  String status;
  String observation;
  String brand;
  IMaterial({
    this.name,
    this.step,
    this.unity,
    this.quantity,
    this.status,
    this.observation,
    this.brand,
  });

  IMaterial copyWith({
    String name,
    String step,
    String unity,
    String quantity,
    String status,
    String observation,
    String brand,
  }) {
    return IMaterial(
      name: name ?? this.name,
      step: step ?? this.step,
      unity: unity ?? this.unity,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      observation: observation ?? this.observation,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'step': step,
      'unity': unity,
      'quantity': quantity,
      'status': status,
      'observation': observation,
      'brand': brand,
    };
  }

  factory IMaterial.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return IMaterial(
      name: map['name'],
      step: map['step'],
      unity: map['unity'],
      quantity: map['quantity'],
      status: map['status'],
      observation: map['observation'],
      brand: map['brand'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IMaterial.fromJson(String source) =>
      IMaterial.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IMaterial(name: $name, step: $step, unity: $unity, quantity: $quantity, status: $status, observation: $observation, brand: $brand)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IMaterial &&
        o.name == name &&
        o.step == step &&
        o.unity == unity &&
        o.quantity == quantity &&
        o.status == status &&
        o.observation == observation &&
        o.brand == brand;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        step.hashCode ^
        unity.hashCode ^
        quantity.hashCode ^
        status.hashCode ^
        observation.hashCode ^
        brand.hashCode;
  }
}
