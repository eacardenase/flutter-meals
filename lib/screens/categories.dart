import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pick your category',
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20, // vertical
          mainAxisSpacing: 20, // horizontal
        ),
        // children: [
        //   for (final category in availableCategoriess)
        //     CategoryGrid(category: category)
        // ],
        children: availableCategoriess
            .map((category) => CategoryGrid(category: category))
            .toList(),
      ),
    );
  }
}
