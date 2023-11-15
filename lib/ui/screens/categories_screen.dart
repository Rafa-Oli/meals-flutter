import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/main/factories/meals_presenter_factory.dart';
import 'package:meals/presentation/presenters/bloc/meals_cubit_presenter.dart';
import 'package:meals/presentation/presenters/bloc/meals_state_presenter.dart';

import '../components/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final MealsCubit presenter = MealsPresenterFactory.create();

  @override
  void initState() {
    presenter.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: presenter,
        builder: (context, state) {
          if (state is CategoriesCubitStateLoaded) {
            return GridView(
              padding: const EdgeInsets.all(25),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: state.categories.map((cat) {
                return CategoryItem(cat);
              }).toList(),
            );
          }

          return Container();
        });
  }
}
