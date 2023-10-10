import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({required this.iconData, required this.label, super.key});

  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData,
            size: 17, color: Theme.of(context).colorScheme.onBackground),
        const SizedBox(
          width: 6,
        ),
        Text(label,
            style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16))
      ],
    );
  }
}
