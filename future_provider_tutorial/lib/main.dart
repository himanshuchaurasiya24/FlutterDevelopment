import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_tutorial/home_screen.dart';
import 'package:future_provider_tutorial/user.dart';
import 'package:http/http.dart' as http;

// 1.11.00 video stopped;
final fetchUserProvider = FutureProvider(
  (ref) {
    const uri = 'https://jsonplaceholder.typicode.com/users/1';
    return http
        .get(
          Uri.parse(uri),
        )
        .then(
          (value) => User.fromJson(value.body),
        );
  },
);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
