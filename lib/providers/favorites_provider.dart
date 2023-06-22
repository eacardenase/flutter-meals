import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isFavoriteMeal = state.contains(meal);

    if (isFavoriteMeal) {
      state = state.where((currentMeal) => currentMeal.id != meal.id).toList();

      return false;
    }

    state = [...state, meal];
    return true;
  }
}

// StateNotifierProvider is optimized for data that can change
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) => FavoriteMealsNotifier(),
);
