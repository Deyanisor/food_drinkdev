import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_drinkdev/providers/Api_provider.dart';
import 'package:food_drinkdev/widgets/categorias_cards.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    final categoriasProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          //_PosterAndTitle(),
          CategoriasCards(categorias: categoriasProvider.onCategoria),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepOrange,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 5),
          color: Colors.black12,
          child: Text('Categoria', style: TextStyle(fontSize: 20)),
        ),
        background: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.deepOrange])),
          child: Image.asset(
            "assets/logo.png",
            height: 200,
          ),
        ),
      ),
    );
  }
}
