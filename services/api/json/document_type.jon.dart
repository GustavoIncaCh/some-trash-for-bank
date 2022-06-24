import 'dart:convert';

DocumentTypeJson documentTypeJsonFromJson(String str) => DocumentTypeJson.fromJson(json.decode(str));

String documentTypeJsonToJson(DocumentTypeJson data) => json.encode(data.toJson());

class DocumentTypeJson {
  DocumentTypeJson({
    required this.id,
    required this.descripcion,
  });

  int     id;
  String  descripcion;

  factory DocumentTypeJson.fromJson(Map<String, dynamic> json) => DocumentTypeJson(
    id          : json[ "id"            ] ?? 0,
    descripcion : json[ "descripcion"   ] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id"            : id,
    "descripcion"   : descripcion,
  };
}