import 'package:equatable/equatable.dart';
import 'package:meals/domain/entities/category_entity.dart';
import 'package:meals/domain/entities/meal_entity.dart';

abstract class MealsCubitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MealsCubitStateInitial extends MealsCubitState {}

class MealsCubitStateLoading extends MealsCubitState {}

class MealsCubitStateLoaded extends MealsCubitState {
  final List<MealEntity> meals;
  MealsCubitStateLoaded({required this.meals});

  @override
  List<Object?> get props => [meals];
}

class CategoriesCubitStateLoaded extends MealsCubitState {
  final List<CategoryEntity> categories;
  CategoriesCubitStateLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class MealsCubitStateError extends MealsCubitState {}
