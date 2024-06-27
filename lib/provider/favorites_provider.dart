import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meals.dart';

class FavoriteNotifire extends StateNotifier<List<Meal>> {
  FavoriteNotifire() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsfavorites = state.contains(meal);

    if (mealIsfavorites) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

  bool favorites(Meal meal) {
    return state.contains(meal);
  }
}

var favoriteProvider =
    StateNotifierProvider<FavoriteNotifire, List<Meal>>((ref) {
  return FavoriteNotifire();
});
