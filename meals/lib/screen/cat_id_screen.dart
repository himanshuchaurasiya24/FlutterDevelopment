import 'package:flutter/material.dart';

class CatIdScreen extends StatelessWidget {
  const CatIdScreen({required this.color, required this.id, super.key});
  final String id;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(id, style: TextStyle(color: color))),
    );
  }
}
