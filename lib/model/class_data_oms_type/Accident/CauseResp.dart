
//------  create class direct cause resp avec les methode par defaut ------------

import 'dart:convert';

class DirectCauseResp {

  final int? id;
  final String? name;

  DirectCauseResp({
    required this.id,
    required this.name,
  });

  factory DirectCauseResp.fromJson(Map<String, dynamic> json) => DirectCauseResp(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };

  factory DirectCauseResp.fromString(String jsonString) =>
      DirectCauseResp.fromJson(json.decode(jsonString));

  String toString() => json.encode(toJson());

}