import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/widgets/meal_item_trait.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    required this.meal,
    super.key,
  });
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0] + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0] + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesMeals = ref.watch(favoritesMealsProvider);
    final isFavorite = favoritesMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: meal.title, child: Text(meal.title)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoritesMealsProvider.notifier)
                    .toggleMealFavoritesStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Meal added as favorites'
                        : 'Meal was removed'),
                  ),
                );
              },
              // icon: isFavorite
              //     ? const Icon(
              //         Icons.favorite,
              //         color: Colors.red,
              //       )
              //     : const Icon(Icons.favorite_border_outlined),
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    // turns: animation,
                    // tween here is used to decide the rotation of the icon between a particular time
                    turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                    child: child,
                  );
                  // return SlideTransition(position: position)
                },
                child: isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                        key: ValueKey(isFavorite),
                      )
                    : Icon(
                        Icons.favorite_border_outlined,
                        key: ValueKey(isFavorite),
                      ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.imageUrl,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                meal.isVegetarian
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.green,
                            // size: 40,
                          ),
                          Text(
                            'Veg',
                            style: TextStyle(color: Colors.green, fontSize: 24),
                          )
                        ],
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.red,
                            size: 16,
                          ),
                          Text(
                            'Non-Veg',
                            style: TextStyle(color: Colors.red, fontSize: 24),
                          )
                        ],
                      ),
                meal.isGlutenFree
                    ? const Row(
                        children: [
                          Text(
                            'Gluten ',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 24),
                          ),
                          Icon(
                            Icons.not_interested,
                            color: Colors.red,
                          )
                        ],
                      )
                    : const Row(
                        children: [
                          Text(
                            'Gluten ',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 24),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        ],
                      ),
                meal.isLactoseFree
                    ? const Row(
                        children: [
                          Text(
                            'Lactose ',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 24),
                          ),
                          Icon(
                            Icons.not_interested,
                            color: Colors.red,
                          )
                        ],
                      )
                    : const Row(
                        children: [
                          Text(
                            'Lactose ',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 24),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        ],
                      ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: meal.duration,
                  child: MealItemTrait(
                    iconData: Icons.schedule_outlined,
                    label: '${meal.duration} min',
                  ),
                ),
                Hero(
                    tag: meal.id,
                    child: MealItemTrait(
                        iconData: (Icons.work), label: complexityText)),
                Hero(
                  tag: meal.ingredients,
                  child: MealItemTrait(
                      iconData: Icons.money_outlined, label: affordabilityText),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredients in meal.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  ingredients,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
