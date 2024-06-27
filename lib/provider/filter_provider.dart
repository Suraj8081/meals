import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/provider/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifire extends StateNotifier<Map<Filter, bool>> {
  FilterNotifire()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  void setFilters(Map<Filter, bool> activeFilters) {
    state = activeFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProviders =
    StateNotifierProvider<FilterNotifire, Map<Filter, bool>>(
  (ref) => FilterNotifire(),
);

final filteredMealProviders = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);

  final activeFilter = ref.watch(filterProviders);

  return meals.where((meal) {
    if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
