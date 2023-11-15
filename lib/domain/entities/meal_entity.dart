import 'package:equatable/equatable.dart';
import 'package:meals/data/models/meal.dart';

class MealEntity extends Equatable {
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
  final Complexity complexity;
  final Cost cost;

  const MealEntity({
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
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Medium:
        return 'Normal';
      case Complexity.Difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.Cheap:
        return 'Barato';
      case Cost.Fair:
        return 'Justo';
      case Cost.Expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }

  static Complexity convertComplexityModelToEntity(ComplexityModel complexityModel) {
    switch (complexityModel) {
      case ComplexityModel.Simple:
        return Complexity.Simple;
      case ComplexityModel.Medium:
        return Complexity.Medium;
      case ComplexityModel.Difficult:
        return Complexity.Difficult;
      default:
        throw Exception('Tipo de modelo não reconhecido');
    }
  }

  static Cost convertCostModelToEntity(CostModel costModel) {
    switch (costModel) {
      case CostModel.Cheap:
        return Cost.Cheap;
      case CostModel.Expensive:
        return Cost.Expensive;
      case CostModel.Fair:
        return Cost.Fair;
      default:
        throw Exception('Tipo de modelo não reconhecido');
    }
  }

  @override
  List<Object?> get props => [
        id,
        categories,
        title,
        imageUrl,
        ingredients,
        steps,
        duration,
        isGlutenFree,
        isLactoseFree,
        isVegan,
        isVegetarian,
        complexity,
        cost,
      ];
}

enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}
