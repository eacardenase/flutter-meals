import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsList extends StatelessWidget {
  const MealsList({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    // alternative of Nativator.push(context, route)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onMealSelected: _selectMeal,
      ),
    );
  }
}
