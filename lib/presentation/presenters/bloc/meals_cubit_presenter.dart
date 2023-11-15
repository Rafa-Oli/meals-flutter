import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/domain/usecases/categories.dart';
import 'package:meals/domain/usecases/meals.dart';
import 'package:meals/presentation/presenters/bloc/meals_state_presenter.dart';

class MealsCubit extends Cubit<MealsCubitState> {
  final MealsCaseUses getMealsUseCase;
  final CategoriesCaseUses getCategoriesUseCase;

  MealsCubit({
    required this.getMealsUseCase,
    required this.getCategoriesUseCase,
  }) : super(MealsCubitStateInitial());

  Future<void> getMeals() async {
    emit(MealsCubitStateLoading());
    try {
      final result = await getMealsUseCase.getMeals();
      emit(MealsCubitStateLoaded(meals: result));
    } catch (e) {
      emit(MealsCubitStateError());
    }
  }

  Future<void> getCategories() async {
    emit(MealsCubitStateLoading());
    try {
      final result = await getCategoriesUseCase.getCategories();
      emit(CategoriesCubitStateLoaded(categories: result));
    } catch (e) {
      emit(MealsCubitStateError());
    }
  }
}
