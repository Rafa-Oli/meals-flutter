import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(category.title),
        ),
        body: Center(
          child: Text('Receitas por Categoria ${category.id}'),
        ));
  }
}
