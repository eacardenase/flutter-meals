import 'package:flutter/material.dart';

import 'package:meals/widgets/filter_switch_list_tile.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
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
    );
  }
}
