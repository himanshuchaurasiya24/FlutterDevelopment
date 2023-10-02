import 'package:flutter/material.dart';
import 'package:sample_app/dice_roller.dart';

const startAlignment = Alignment.topLeft; // this can be changed so
// if we dont want to make initialize it we can just declare it;
// var startAlignment;
// above var type will be dynamic;
// if we want to make var of specific type we can declare it like this
// Alignment? startAlignment;
// or we can use const keyword ...
//to prevent overriding the value of the declared above;
const endAlignment = Alignment.bottomRight;
String? imagePath = 'assets/images/dice-1.png';

class GradientContainer extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;

  const GradientContainer(
      {required this.firstColor, required this.secondColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [firstColor, secondColor],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
