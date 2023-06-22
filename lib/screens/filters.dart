import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/widgets/filter_switch_list_tile.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  void _toggleGlutenFreeFilter(bool isChecked) {
    setState(() => _glutenFreeFilterSet = isChecked);
  }

  void _toggleLactoseFreeFilter(bool isChecked) {
    setState(() => _lactoseFreeFilterSet = isChecked);
  }

  void _toggleVegetarianFilter(bool isChecked) {
    setState(() => _vegetarianFilterSet = isChecked);
  }

  void _toggleVeganFilter(bool isChecked) {
    setState(() => _veganFilterSet = isChecked);
  }

  Future<bool> _onPop() async {
    ref.read(filtersProvider.notifier).setFilters({
      Filter.gluttenFree: _glutenFreeFilterSet,
      Filter.lactoseFree: _lactoseFreeFilterSet,
      Filter.vegetarian: _vegetarianFilterSet,
      Filter.vegan: _veganFilterSet,
    });

    return true;
  }

  @override
  void initState() {
    super.initState();

    final activeFilters = ref.read(filtersProvider);

    _glutenFreeFilterSet = activeFilters[Filter.gluttenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: _onPop,
        child: Column(
          children: [
            FilterSwitchListTile(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              isFilterSet: _glutenFreeFilterSet,
              onSwitchToggle: _toggleGlutenFreeFilter,
            ),
            FilterSwitchListTile(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              isFilterSet: _lactoseFreeFilterSet,
              onSwitchToggle: _toggleLactoseFreeFilter,
            ),
            FilterSwitchListTile(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              isFilterSet: _vegetarianFilterSet,
              onSwitchToggle: _toggleVegetarianFilter,
            ),
            FilterSwitchListTile(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              isFilterSet: _veganFilterSet,
              onSwitchToggle: _toggleVeganFilter,
            ),
          ],
        ),
      ),
    );
  }
}
