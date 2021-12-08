import 'dart:convert';

import 'especialidad.dart';

class NowEspecilidadResponse {
  NowEspecilidadResponse({
    required this.respuesta,
    required this.datos,
  });

  String respuesta;
  Especilidad datos;

  factory NowEspecilidadResponse.fromJson(String str) =>
      NowEspecilidadResponse.fromMap(json.decode(str));

  factory NowEspecilidadResponse.fromMap(Map<String, dynamic> json) =>
      NowEspecilidadResponse(
        respuesta: json["respuesta"],
        datos: Especilidad.fromMap(json["datos"]),
      );
}
