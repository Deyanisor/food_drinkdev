import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoriasCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        child: ListView.builder(
            itemCount: 4, itemBuilder: (_, int index) => _CategoriaCards()));
  }
}

class _CategoriaCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: 110,
      height: 250,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Center(
              child: Column(
            children: [
              Text(
                'Categoria',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text('Descripción',
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
