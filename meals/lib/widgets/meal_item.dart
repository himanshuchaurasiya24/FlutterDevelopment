import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key, required this.onSelectMeal});
  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;
  String get complexityText {
    return meal.complexity.name[0] + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0] + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () {
          onSelectMeal(context, meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.imageUrl,
              child: FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                child: Column(
                  children: [
                    Hero(
                      tag: meal.title,
                      child: Text(
                        meal.title, maxLines: 2, textAlign: TextAlign.center,
                        softWrap: true, overflow: TextOverflow.ellipsis, //...
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: meal.duration,
                          child: MealItemTrait(
                            iconData: Icons.schedule_outlined,
                            label: '${meal.duration} min',
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Hero(
                          tag: meal.id,
                          child: MealItemTrait(
                              iconData: Icons.work, label: complexityText),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Hero(
                          tag: meal.ingredients,
                          child: MealItemTrait(
                              iconData: Icons.money_outlined,
                              label: affordabilityText),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
