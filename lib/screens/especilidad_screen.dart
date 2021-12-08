import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_drinkdev/models/especialidad.dart';
import 'package:food_drinkdev/providers/Api_provider.dart';
import 'package:food_drinkdev/screens/login_screen.dart';
import 'package:provider/provider.dart';

class EspeciliadadStreen extends StatelessWidget {
  static const String id = 'EspecilidadScreen';
  Especilidad especilidad =
      Especilidad(nombre: '', descripcion: '', precio: 0, urlFoto: '');

  @override
  Widget build(BuildContext context) {
    final especilidadesProvider = Provider.of<ApiProvider>(context);
    this.especilidad = especilidadesProvider.onEspecilidad;
    print(especilidadesProvider.onEspecilidad);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.deepOrange])),
        ),
        Transform.translate(
            offset: Offset(0, -100),
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, top: 260),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Column(children: <Widget>[
                        Text(
                          'Especilidad',
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 30),
                        ),
                        Text(
                          especilidad.nombre,
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 30),
                        ),
                        Image.network(
                          especilidad.urlFoto,
                          height: 200,
                        ),
                        Text(especilidad.descripcion),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Precio: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              )),
                          TextSpan(
                            text: especilidad.precio.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ])),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                                onPressed: () {
                                  //Go to login screen.
                                  Navigator.pushNamed(context, LoginScreen.id);
                                },
                                //Implement login functionality.
                                minWidth: 200.0,
                                height: 42.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Iniciar Sesión',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            )))
      ],
    ));
  }
}
