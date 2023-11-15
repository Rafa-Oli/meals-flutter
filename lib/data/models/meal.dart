import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meals/domain/entities/meal_entity.dart';

enum ComplexityModel {
  Simple,
  Medium,
  Difficult,
}

enum CostModel {
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final ComplexityModel complexity;
  final CostModel cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case ComplexityModel.Simple:
        return 'Simples';
      case ComplexityModel.Medium:
        return 'Normal';
      case ComplexityModel.Difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case CostModel.Cheap:
        return 'Barato';
      case CostModel.Fair:
        return 'Justo';
      case CostModel.Expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }

  Meal copyWith({
    String? id,
    List<String>? categories,
    String? title,
    String? imageUrl,
    List<String>? ingredients,
    List<String>? steps,
    int? duration,
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegan,
    bool? isVegetarian,
    ComplexityModel? complexity,
    CostModel? cost,
  }) {
    return Meal(
      id: id ?? this.id,
      categories: categories ?? this.categories,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      duration: duration ?? this.duration,
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isVegan: isVegan ?? this.isVegan,
      isVegetarian: isVegetarian ?? this.isVegetarian,
      complexity: complexity ?? this.complexity,
      cost: cost ?? this.cost,
    );
  }

  MealEntity toEntity() => MealEntity(
      id: id,
      categories: categories,
      title: title,
      imageUrl: imageUrl,
      ingredients: ingredients,
      steps: steps,
      duration: duration,
      isGlutenFree: isGlutenFree,
      isLactoseFree: isLactoseFree,
      isVegan: isVegan,
      isVegetarian: isVegetarian,
      complexity: MealEntity.convertComplexityModelToEntity(complexity),
      cost: MealEntity.convertCostModelToEntity(cost));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
      'complexity': complexity,
      'cost': cost,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] ?? '',
      categories: List<String>.from(map['categories']),
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      ingredients: List<String>.from(map['ingredients']),
      steps: List<String>.from(map['steps']),
      duration: map['duration']?.toInt() ?? 0,
      isGlutenFree: map['isGlutenFree'] ?? false,
      isLactoseFree: map['isLactoseFree'] ?? false,
      isVegan: map['isVegan'] ?? false,
      isVegetarian: map['isVegetarian'] ?? false,
      complexity: map['complexity'],
      cost: map['cost'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meal(id: $id, categories: $categories, title: $title, imageUrl: $imageUrl, ingredients: $ingredients, steps: $steps, duration: $duration, isGlutenFree: $isGlutenFree, isLactoseFree: $isLactoseFree, isVegan: $isVegan, isVegetarian: $isVegetarian, complexity: $complexity, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Meal &&
        other.id == id &&
        listEquals(other.categories, categories) &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.steps, steps) &&
        other.duration == duration &&
        other.isGlutenFree == isGlutenFree &&
        other.isLactoseFree == isLactoseFree &&
        other.isVegan == isVegan &&
        other.isVegetarian == isVegetarian &&
        other.complexity == complexity &&
        other.cost == cost;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categories.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        ingredients.hashCode ^
        steps.hashCode ^
        duration.hashCode ^
        isGlutenFree.hashCode ^
        isLactoseFree.hashCode ^
        isVegan.hashCode ^
        isVegetarian.hashCode ^
        complexity.hashCode ^
        cost.hashCode;
  }
}
