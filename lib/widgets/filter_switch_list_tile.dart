import 'package:flutter/material.dart';

class FilterSwitchListTile extends StatelessWidget {
  const FilterSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isFilterSet,
    required this.onSwitchToggle,
  });

  final String title;
  final String subtitle;
  final bool isFilterSet;
  final void Function(bool) onSwitchToggle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isFilterSet,
      onChanged: onSwitchToggle,
      title: Text(title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )),
      subtitle: Text(subtitle,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
