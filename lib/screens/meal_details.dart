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
      body: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
        image: NetworkImage(
          meal.imageUrl,
        ),
      ),
    );
  }
}
