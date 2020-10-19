import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      // passando o nome da rota nomeada
      '/categories-meals',
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                category.image,
              ),
              matchTextDirection: true,
              alignment: Alignment.bottomRight,
            ),
            color: category.color,
            boxShadow: [
              //sombra
              BoxShadow(
                offset: const Offset(0.1, 0.1),
                blurRadius: 5.0,
                spreadRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }
}
