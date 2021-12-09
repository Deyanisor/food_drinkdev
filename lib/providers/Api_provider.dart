import 'package:flutter/material.dart';
import 'package:food_drinkdev/models/IniciarSesion.dart';
import 'package:food_drinkdev/models/categoria.dart';
import 'package:food_drinkdev/models/especialidad.dart';
import 'package:food_drinkdev/models/now_categoria_response.dart';
import 'package:food_drinkdev/models/now_especilidad_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  String _baseUrl = 'wsc.fabricasoftware.co';
  String _Correo = 'deyanis@yopmail.com';
  String _Contrasena = '456789';
  List<Categoria> onCategoria = [];
  Especilidad onEspecilidad =
      Especilidad(nombre: '', descripcion: '', precio: 0, urlFoto: '');
  InciarSesionCliente onIniciarSesion =
      InciarSesionCliente(respuesta: '', nombre: '', idCliente: 0, token: '');

  ApiProvider() {
    this.getonApiProvider();
    this.getOnEspecilidad();
    this.getOnIncioSesion();
  }

  getonApiProvider() async {
    var url = Uri.https(_baseUrl, '/api/categorias');

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowCategoriaResponse = NewCategoriaResponse.fromJson(response.body);

    onCategoria = nowCategoriaResponse.datos;

    notifyListeners();
  }

  getOnEspecilidad() async {
    var url = Uri.https(_baseUrl, '/api/especialidad');

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowEspecilidadResponse =
        NowEspecilidadResponse.fromJson(response.body);

    onEspecilidad = nowEspecilidadResponse.datos as Especilidad;

    print(onIniciarSesion.respuesta);

    notifyListeners();
  }

  getOnIncioSesion() async {
    var url = Uri.https(_baseUrl, '/api/clientes',
        {'correo': _Correo, 'contrasena': _Contrasena});

    final response = await http.get(url);

    final nowIniciarSesionResponse =
        InciarSesionCliente.fromJson(response.body);

    onIniciarSesion = nowIniciarSesionResponse.respuesta as InciarSesionCliente;

    notifyListeners();
  }
}
