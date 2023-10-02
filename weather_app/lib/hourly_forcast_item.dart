import 'package:flutter/material.dart';

class HourlyForcastItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String value;
  final String currentSky;
  const HourlyForcastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.value,
    required this.currentSky,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Text(
            time,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Icon(icon, size: 32),
          const SizedBox(
            height: 8,
          ),
          Text(value),
          Text(
            currentSky,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
