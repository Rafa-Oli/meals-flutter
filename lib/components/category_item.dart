import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
          // centerSlice: Rect.fromCenter(2.0,20.0,25.0) ,
          fit: BoxFit.fitHeight,
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
    );
  }
}
