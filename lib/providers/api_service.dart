import 'dart:convert';

import 'package:food_drinkdev/models/response/error_response.dart';
import 'package:food_drinkdev/models/response/login_response.dart';
import 'package:food_drinkdev/models/response/response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Response> login(String email, String password) async {
    var url = Uri.parse(
        'https://wsc.fabricasoftware.co/api/clientes?correo=${email}&contrasena=${password}');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }
    var decodedJson = jsonDecode(body);
    var resp = LoginResponse.fromJson(decodedJson);

    if (resp.respuesta == "OK") {
      return Response(
          isSuccess: true, result: LoginResponse.fromJson(decodedJson));
    } else {
      return Response(
          isSuccess: false, result: ErrorResponse.fromJson(decodedJson));
    }
  }
}
