import 'dart:convert';

class Especilidad {
  Especilidad({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.urlFoto,
  });

  String nombre;
  String descripcion;
  int precio;
  String urlFoto;

  factory Especilidad.fromJson(String str) =>
      Especilidad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Especilidad.fromMap(Map<String, dynamic> json) => Especilidad(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        urlFoto: json["url_foto"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "url_foto": urlFoto,
      };
}
