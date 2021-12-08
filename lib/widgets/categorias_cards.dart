import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriasCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: 800,
        color: Colors.deepOrange,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (_, int index) => _CategoriaCards()));
  }
}

class _CategoriaCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 110,
      height: 100,
      color: Colors.green,
    );
  }
}
