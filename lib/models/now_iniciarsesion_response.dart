import 'dart:convert';

class Nowiniciarsesion {
  Nowiniciarsesion({
    this.respuesta,
    this.mensaje,
  });

  String? respuesta;
  String? mensaje;

  factory Nowiniciarsesion.fromJson(String str) =>
      Nowiniciarsesion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nowiniciarsesion.fromMap(Map<String, dynamic> json) =>
      Nowiniciarsesion(
        respuesta: json["respuesta"],
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "respuesta": respuesta,
        "mensaje": mensaje,
      };
}
