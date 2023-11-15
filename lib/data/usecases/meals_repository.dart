import 'package:meals/data/dummy_data.dart';
import 'package:meals/domain/entities/meal_entity.dart';
import 'package:meals/domain/usecases/meals.dart';

class MealsRepository extends MealsCaseUses {
  @override
  List<MealEntity> getMeals() {
    return DUMMY_MEALS.map((e) => e.toEntity()).toList();
  }
}
