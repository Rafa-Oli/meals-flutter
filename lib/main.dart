import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'dart:ui';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/meal_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) =>
            CategoriesScreen(), // rota raiz como padrão a iniciar
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
    );
  }
}
