import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen();
        },
      ),
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
            fit: BoxFit.scaleDown,
            image: AssetImage(
              category.image,
            ),
            // centerSlice: Rect.fromCenter(2.0,20.0,25.0) ,

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
      ),
    );
  }
}
