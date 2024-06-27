import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/provider/filter_provider.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/filter.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widget/main_drawer.dart';

const kInitialFIlters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabsScreen> {
  int _activePageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _activePageIndex = index;
    });
  }

  void _selectScreen(String indentifire) async {
    Navigator.pop(context);
    if (indentifire == 'filter') {
      await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    } else {
      _selectPage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMaal = ref.watch(filteredMealProviders);

    Widget activePage = CategoriesScreen(
      availableMeal: availableMaal,
    );
    String appBarTitle = 'Categories';

    if (_activePageIndex == 1) {
      final favoritesMeals = ref.watch(favoriteProvider);
      activePage = MealsScreen(
        meals: favoritesMeals,
      );
      appBarTitle = 'Your Favorite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _activePageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categeries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
