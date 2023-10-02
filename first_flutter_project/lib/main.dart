import 'package:first_flutter_project/loggedin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const FlutterCounterApp());
}

class FlutterCounterApp extends StatelessWidget {
  const FlutterCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashBoardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final texteditingController1 = TextEditingController();
    final texteditingController2 = TextEditingController();
    // final border = OutlineInputBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(20)),
    //     borderSide: BorderSide(color: Color.fromARGB(255, 230, 0, 2)));
    const color = Color.fromARGB(255, 230, 0, 2);
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
          color: color,
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter),
      borderRadius: BorderRadius.circular(16),
    );
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login_bg_red.jpg'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Page',
              style: TextStyle(
                  fontSize: 60, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: texteditingController1,
              style: const TextStyle(color: color),
              cursorColor: color,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: color,
                  focusedBorder: border,
                  enabledBorder: border,
                  hintText: 'Enter username here',
                  hintStyle: const TextStyle(color: color)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: texteditingController2,
              obscureText: true,
              textInputAction: TextInputAction.done,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              style: const TextStyle(color: color),
              cursorColor: color,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  prefixIconColor: color,
                  // suffixIcon: IconButton(
                  //   icon: Icon(passwordVisible
                  //       ? Icons.visibility
                  //       : Icons.visibility_off),
                  //   onPressed: () {
                  //     setState(() {
                  //       passwordVisible = !passwordVisible;
                  //     });
                  //   },
                  // ),
                  focusedBorder: border,
                  enabledBorder: border,
                  hintText: 'Enter password here',
                  hintStyle: const TextStyle(color: color)),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                // final snakbar = SnackBar(
                //   content: const Text('You have logged in'),
                //   action: SnackBarAction(label: 'Okay', onPressed: () {}),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snakbar);
                final username = texteditingController1.text.toString();
                final password = texteditingController2.text.toString();
                if (username.isNotEmpty && password.isNotEmpty) {
                  if (username == 'himanshuchaurasiya24' &&
                      password == '1234567890') {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const LoggedIn();
                    }));
                  } else {
                    final snackbar = SnackBar(
                      content: const Text('Incorrect usrname or password'),
                      action: SnackBarAction(label: 'Retry', onPressed: () {}),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                } else {
                  final snackbar = SnackBar(
                    content: const Text('Please enter username and password!'),
                    action: SnackBarAction(label: 'Okay', onPressed: () {}),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  minimumSize: const Size(
                    100,
                    40,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('or login with'),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: 300,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(237, 128, 128, 1),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/google_color.svg'),
                  const Padding(padding: EdgeInsets.only(right: 16)),
                  SvgPicture.asset('assets/facebook_color.svg'),
                  const Padding(padding: EdgeInsets.only(right: 16)),
                  SvgPicture.asset('assets/outlook_color.svg')
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
