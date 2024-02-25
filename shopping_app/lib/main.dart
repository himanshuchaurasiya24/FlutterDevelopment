import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/home_page.dart';

import 'providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      /*
        multiprovider(
          providers: [
            chagenotificationprovider(create: (context) => CartProvider()),
          ],
        )




      */
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shoping App',
        home: const HomePage(),
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(254, 206, 1, 1),
                primary: const Color.fromRGBO(254, 206, 1, 1)),
            inputDecorationTheme: const InputDecorationTheme(
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            textTheme: const TextTheme(
                titleLarge:
                    TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                bodySmall: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                // color: Colors.white,
                titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ))),
      ),
    );
  }
}
