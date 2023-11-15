import 'package:meals/data/dummy_data.dart';
import 'package:meals/domain/entities/category_entity.dart';
import 'package:meals/domain/usecases/categories.dart';

class CategoryRepository extends CategoriesCaseUses {
  @override
  List<CategoryEntity> getCategories() {
    return DUMMY_CATEGORIES.map((e) => e.toEntity()).toList();
  }
}
