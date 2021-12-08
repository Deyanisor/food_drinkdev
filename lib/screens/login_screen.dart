import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_drinkdev/screens/home_screen.dart';
import 'package:food_drinkdev/screens/registre_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _emailError = '';
  bool _emailShowError = false;

  String _password = '';
  String _passwordError = '';
  bool _passwordShowError = false;

  bool _passwordshow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _showLogo(),
        _carsLogo(),
      ],
    ));
  }

  Widget _showLogo() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.orangeAccent, Colors.deepOrange])),
      child: Image.asset(
        "assets/logo.png",
        height: 200,
      ),
    );
  }

  Widget _carsLogo() {
    return Transform.translate(
        offset: Offset(0, -35),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _showEmail(),
                      SizedBox(
                        height: 40.0,
                      ),
                      _showPassword(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _showButtons(),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("¿No esta registrado?"),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.deepOrange),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegistrationScreen.id);
                            },
                            child: const Text('Registrarse'),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget _showEmail() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Ingresa tu correo',
        labelText: 'Email',
        errorText: _emailShowError ? _emailError : null,
        prefixIcon: Icon(Icons.alternate_email),
        suffixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
      onChanged: (value) {
        _email = value;
      },
    );
  }

  Widget _showPassword() {
    return TextField(
      obscureText: !_passwordshow,
      decoration: InputDecoration(
        hintText: 'Ingrese tu contraseña',
        labelText: 'Contraseña',
        errorText: _passwordShowError ? _passwordError : null,
        suffixIcon: IconButton(
          icon: _passwordshow
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {});
            _passwordshow = !_passwordshow;
          },
        ),
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
      onChanged: (value) {
        _password = value;
      },
    );
  }

  Widget _showButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        elevation: 5.0,
        child: MaterialButton(
            onPressed: () {
              _login();
              Navigator.pushNamed(context, HomeScreen.id);
            },
            //Implement login functionality.

            minWidth: 200.0,
            height: 42.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            )),
      ),
    );
  }

  void _login() {
    if (!_validateFields()) {
      return;
    }
  }

  bool _validateFields() {
    bool hasErros = false;
    if (_email.isEmpty) {
      _emailShowError = true;
      _emailError = 'Debes ingresar tu email.';
    } else if (!EmailValidator.validate(_email)) {
      _emailShowError = true;
      _emailError = 'Debes ingresar un email valido.';
    } else {
      _emailShowError = false;
    }

    if (_password.isEmpty) {
      _passwordShowError = true;
      _passwordError = 'Debes ingresar tu contraseña.';
    } else if (_password.length < 6) {
      _passwordShowError = true;
      _passwordError = 'Debes ingresar un contraseña de al menos 6 caracteres.';
    } else {
      _passwordShowError = false;
    }
    setState(() {});

    return hasErros;
  }
}
