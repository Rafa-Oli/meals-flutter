import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
              color: Colors.teal,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      home: CategoriesScreen(),
    );
  }
}
