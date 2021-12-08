import 'package:flutter/material.dart';
import 'package:food_drinkdev/models/categoria.dart';
import 'package:food_drinkdev/models/especialidad.dart';
import 'package:food_drinkdev/models/now_categoria_response.dart';
import 'package:food_drinkdev/models/now_especilidad_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  String _baseUrl = 'wsc.fabricasoftware.co';

  List<Categoria> onCategoria = [];
  Especilidad onEspecilidad =
      Especilidad(nombre: '', descripcion: '', precio: 0, urlFoto: '');

  ApiProvider() {
    this.getonApiProvider();
    this.getOnEspecilidad();
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

    notifyListeners();
  }
}
