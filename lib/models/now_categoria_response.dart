import 'dart:convert';

import 'categoria.dart';

class NewCategoriaResponse {
  NewCategoriaResponse({
    required this.respuesta,
    required this.datos,
  });

  String respuesta;
  List<Categoria> datos;

  factory NewCategoriaResponse.fromJson(String str) =>
      NewCategoriaResponse.fromMap(json.decode(str));

  factory NewCategoriaResponse.fromMap(Map<String, dynamic> json) =>
      NewCategoriaResponse(
        respuesta: json["respuesta"],
        datos: List<Categoria>.from(
            json["datos"].map((x) => Categoria.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //     "respuesta": respuesta,
  //   "datos": List<dynamic>.from(datos.map((x) => x.toMap())),
  // };
}
