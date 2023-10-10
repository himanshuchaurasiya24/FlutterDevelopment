import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {required this.meal, super.key, required this.onToggleFavorites});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  onToggleFavorites(meal);
                },
                icon: const Icon(Icons.favorite_outline)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            meal.isVegetarian
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.green,
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
                      ),
                      Text(
                        'Non-Veg',
                        style: TextStyle(color: Colors.red, fontSize: 24),
                      )
                    ],
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                meal.isGlutenFree
                    ? const Row(
                        children: [
                          Text(
                            'Gluten ',
                            style: TextStyle(color: Colors.white, fontSize: 24),
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
                            style: TextStyle(color: Colors.white, fontSize: 24),
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
                            style: TextStyle(color: Colors.white, fontSize: 24),
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
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        ],
                      ),
              ],
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
