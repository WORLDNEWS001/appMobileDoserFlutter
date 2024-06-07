import 'dart:convert';

import 'package:collection/collection.dart';

class VehicleTypeResp {
  int? code;
  int? id;
  String? value;

  VehicleTypeResp({this.code, this.id, this.value});

  @override
  String toString() {
    return 'VehicleTypeResp(code: $code, id: $id, value: $value)';
  }

  factory VehicleTypeResp.fromMap(Map<String, dynamic> data) {
    return VehicleTypeResp(
      code: data['code'] as int?,
      id: data['id'] as int?,
      value: data['value'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'id': id,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VehicleTypeResp].
  factory VehicleTypeResp.fromJson(String data) {
    return VehicleTypeResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VehicleTypeResp] to a JSON string.
  String toJson() => json.encode(toMap());

  VehicleTypeResp copyWith({
    int? code,
    int? id,
    String? value,
  }) {
    return VehicleTypeResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VehicleTypeResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
