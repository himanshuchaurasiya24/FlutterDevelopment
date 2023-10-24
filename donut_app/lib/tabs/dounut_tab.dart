import 'package:donut_app/tiles/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({super.key});
  final List donutOnSale = const [
    // flavour, price, color, imageName
    ['Ice Cream', '36', Colors.blue, 'assets/images/icecream_donut.png'],
    ['Strawberry', '45', Colors.red, 'assets/images/strawberry_donut.png'],
    ['Grape Ape', '84', Colors.purple, 'assets/images/grape_donut.png'],
    ['Chocolate', '95', Colors.brown, 'assets/images/chocolate_donut.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: donutOnSale.length,
      itemBuilder: (context, index) {
        return DonutTile(
            flavour: donutOnSale[index][0],
            price: donutOnSale[index][1],
            color: donutOnSale[index][2],
            image: donutOnSale[index][3]);
      },
    );
  }
}
