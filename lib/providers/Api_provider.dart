import 'package:flutter/material.dart';
import 'package:food_drinkdev/models/categoria.dart';
import 'package:food_drinkdev/models/now_categoria_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  String _baseUrl = 'wsc.fabricasoftware.co';

  List<Categoria> onCategoria = [];
  ApiProvider() {
    print('ApiProvider incicializado');

    this.getonApiProvider();
  }

  getonApiProvider() async {
    var url = Uri.https(_baseUrl, '/api/categorias');

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowCategoriaResponse = NewCategoriaResponse.fromJson(response.body);

    onCategoria = nowCategoriaResponse.datos;

    notifyListeners();
  }
}
