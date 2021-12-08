import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  String _baseUrl = 'wsc.fabricasoftware.co';
  ApiProvider() {
    print('ApiProvider incicializado');

    this.getonApiProvider();
  }

  getonApiProvider() async {
    var url = Uri.https(_baseUrl, '/api/categorias');

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);

    print(decodedData);
  }
}
