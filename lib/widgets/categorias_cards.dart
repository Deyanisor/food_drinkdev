import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_drinkdev/models/categoria.dart';

class CategoriasCards extends StatelessWidget {
  final List<Categoria> categorias;

  const CategoriasCards({Key? key, required this.categorias}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (_, int index) {
          final categoria = categorias[index];
          print(categoria.urlImagen);
          return _CategoriaCards(categoria);
        },
      ),
    );
  }
}

class _CategoriaCards extends StatelessWidget {
  final Categoria categoria;

  const _CategoriaCards(this.categoria);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: 500,
      height: 250,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"),
              image: NetworkImage(categoria.urlImagen),
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Center(
              child: Column(
            children: [
              Text(
                categoria.nombre,
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(categoria.descripcion,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ],
          ))
        ],
      ),
    );
  }
}
