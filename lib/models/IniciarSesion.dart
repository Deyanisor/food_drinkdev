import 'dart:convert';

class InciarSesionCliente {
  InciarSesionCliente({
    this.respuesta,
    this.nombre,
    this.idCliente,
    this.token,
  });

  String? respuesta;
  String? nombre;
  int? idCliente;
  String? token;

  factory InciarSesionCliente.fromJson(String str) =>
      InciarSesionCliente.fromMap(json.decode(str));

  factory InciarSesionCliente.fromMap(Map<String, dynamic> json) =>
      InciarSesionCliente(
        respuesta: json["respuesta"],
        nombre: json["nombre"],
        idCliente: json["idCliente"],
        token: json["token"],
      );
}
