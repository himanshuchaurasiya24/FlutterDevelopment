import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  const DonutTile(
      {super.key,
      required this.flavour,
      required this.price,
      required this.color,
      required this.image});
  final String flavour;
  final String price;
  final color;
  final String image;
  final double borderRadius = 12;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  child: Text(
                    '₹ $price',
                    style: TextStyle(
                      color: color[800],
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Image.asset(image),
            ),
            Text(
              flavour,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: color[800],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Dunkins',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.favorite_outlined,
                    color: Colors.red[400],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.add_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
