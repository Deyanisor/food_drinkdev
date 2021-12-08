import 'dart:convert';

class Categoria {
  Categoria({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.urlImagen,
  });

  int id;
  String nombre;
  String descripcion;
  String urlImagen;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        urlImagen: json["url_imagen"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "url_imagen": urlImagen,
      };
}
