import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
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
