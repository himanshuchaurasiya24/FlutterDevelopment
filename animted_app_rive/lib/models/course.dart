import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color color;
  Course({
    required this.title,
    this.description = 'Build and animate an iso app from scratch',
    this.iconSrc = 'assets/icons/ios.svg',
    this.color = const Color(0xff7553f6),
  });
}

List<Course> courses = [
  Course(title: 'Animation in Swift UI'),
  Course(
      title: 'Animation in Flutter',
      iconSrc: 'assets/icons/code.svg',
      color: const Color(0xff80a4ff))
];
List<Course> recentCourses = [
  Course(title: 'State Machine'),
  Course(
      title: 'Animated Menu',
      iconSrc: 'assets/icons/code.svg',
      color: const Color(0xff9cc5ff))
];
