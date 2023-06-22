import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  _onFavoriteSelected(WidgetRef ref, BuildContext context, Meal meal) {
    String message;
    final isFavoriteMealAdded =
        ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal);

    if (isFavoriteMealAdded) {
      message = 'Marked as a favorite!';
    } else {
      message = 'Meal is no longer a favorite.';
    }

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 2,
        ),
        content: Text(
          message,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
            onPressed: () => _onFavoriteSelected(ref, context, meal),
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              image: NetworkImage(
                meal.imageUrl,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            // for (final ingredient in meal.ingredients)
            //   Text(
            //     ingredient,
            //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //           color: Theme.of(context).colorScheme.onBackground,
            //         ),
            //   )
            ...meal.ingredients
                .map((ingredient) => Text(
                      ingredient,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ))
                .toList(),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 14,
            ),
            ...meal.steps.map(
              (step) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
