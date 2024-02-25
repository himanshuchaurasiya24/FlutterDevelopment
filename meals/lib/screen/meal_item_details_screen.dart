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
          ],
        ),
      ),
    );
  }
}
