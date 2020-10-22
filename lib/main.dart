import 'package:flutter/material.dart';

import 'dart:ui';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings =
      Settings(); // vai esta com o estado de quais configurações foram setadas nas configurações

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        // filtrando em cima da lista original
        this.settings = settings; // setando a configuração e salvando
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    // olhar se ta contido como favorito
    return _favoriteMeals.contains(meal);
  }

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
            TabsScreen(_favoriteMeals), // rota raiz como padrão a iniciar
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
