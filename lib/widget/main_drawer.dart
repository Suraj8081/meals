import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectScreen});

  final Function(String indentifire) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8)
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
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Cooking Up',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('meal');
            },
            leading: Icon(
              Icons.restaurant,
              size: 27,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meal',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filter');
            },
            leading: Icon(
              Icons.settings,
              size: 27,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filter',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
