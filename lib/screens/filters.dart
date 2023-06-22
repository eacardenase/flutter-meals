import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/widgets/filter_switch_list_tile.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchListTile(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            isFilterSet: activeFilters[Filter.gluttenFree]!,
            onSwitchToggle: (isActive) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.gluttenFree, isActive),
          ),
          FilterSwitchListTile(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            isFilterSet: activeFilters[Filter.lactoseFree]!,
            onSwitchToggle: (isActive) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isActive),
          ),
          FilterSwitchListTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            isFilterSet: activeFilters[Filter.vegetarian]!,
            onSwitchToggle: (isActive) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, isActive),
          ),
          FilterSwitchListTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            isFilterSet: activeFilters[Filter.vegan]!,
            onSwitchToggle: (isActive) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, isActive),
          ),
        ],
      ),
    );
  }
}
