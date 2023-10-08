import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealItemDetailsScreen extends StatelessWidget {
  final Meal meal;
  final BuildContext context;

  const MealItemDetailsScreen(
      {required this.context, super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Ingredients',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            for (int i = 0; i < meal.ingredients.length; i++)
              Text(
                meal.ingredients[i],
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 24, color: Colors.white),
              ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            for (int i = 0; i < meal.steps.length; i++)
              Text(
                meal.steps[i],
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 24, color: Colors.white),
              ),
            Row(
              children: [
                meal.isVegetarian
                    ? const Icon(
                        Icons.circle_outlined,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: Colors.red,
                      ),
                const SizedBox(
                  width: 12,
                ),
                meal.isGlutenFree
                    ? const Text('Gluten Free')
                    : const Text('Gluten'),
                meal.isLactoseFree
                    ? const Text('Lactose Free')
                    : const Text('Lactose'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
