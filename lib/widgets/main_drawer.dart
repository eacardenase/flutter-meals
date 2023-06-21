import 'package:flutter/material.dart';

import 'package:meals/widgets/main_drawer_list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(
              20,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        // fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          MainDrawerListTile(
            tileTitle: 'Meals',
            icon: Icons.restaurant,
            onTileSelected: () {},
          ),
          MainDrawerListTile(
            tileTitle: 'Filters',
            icon: Icons.settings,
            onTileSelected: () {},
          ),
        ],
      ),
    );
  }
}
