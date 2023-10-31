import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/home_screen.dart';
import 'package:riverpod_tutorial/user.dart';

// final nameProvider = StateProvider<String?>((ref) {
//   return 'Himanshu Chaurasiya';
// });
// final nameProvider = Provider<String?>((ref) {
// //   return 'Himanshu Chaurasiya';
// // });

//                                        return type ie..notifierclass and state
final nameProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(const User(name: "Himanshu Chaurasiya", age: 23)),
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
