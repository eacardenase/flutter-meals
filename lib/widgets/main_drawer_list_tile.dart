import 'package:flutter/material.dart';

class MainDrawerListTile extends StatelessWidget {
  const MainDrawerListTile({
    super.key,
    required this.tileTitle,
    required this.onTileSelected,
    required this.icon,
  });

  final String tileTitle;
  final void Function() onTileSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        tileTitle,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
      ),
      onTap: onTileSelected,
    );
  }
}
