import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      decoration: BoxDecoration(
        color: category.color,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.1, 0.1),
            blurRadius: 5.0,
            spreadRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.circular(15),

        // gradient: LinearGradient(
        //   colors: [
        //     category.color.withOpacity(0.8),
        //     category.color,
        //   ],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
      ),
    );
  }
}
