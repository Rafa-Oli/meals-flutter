import 'package:meals/main/factories/categories_cases_uses_factory.dart';
import 'package:meals/main/factories/meals_cases_uses_factory.dart';
import 'package:meals/presentation/presenters/bloc/meals_cubit_presenter.dart';

class MealsPresenterFactory {
  static MealsCubit create() {
    return MealsCubit(getMealsUseCase: MealsCasesUsesFactory.create(), getCategoriesUseCase: CategoriesCasesUsesFactory.create());
  }
}
