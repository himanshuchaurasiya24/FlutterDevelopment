import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/filters_screen.dart';
import 'package:meals/screen/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoritesMeals = [];
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const FiltersScreen();
          },
        ),
      );
    }
  }

  void _toggleMealFavouritesStatus(Meal meal) {
    final isExisting = _favoritesMeals.contains(meal);
    if (isExisting) {
      _favoritesMeals.remove(meal);
      _showInfoMessage('${meal.title} has been removed');
    } else {
      _favoritesMeals.add(meal);
      _showInfoMessage('${meal.title} has been added');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorites: _toggleMealFavouritesStatus,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
          onToggleFavorites: _toggleMealFavouritesStatus,
          meals: _favoritesMeals);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
