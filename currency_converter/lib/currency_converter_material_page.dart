import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(16),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 82, 82),
        elevation: 0,
        title: const Text("Currency Converter"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 228, 82, 82),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                  fontSize: 80,
                  //  fontWeight: FontWeight.w900
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            // padding and container
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    //     label: Text(
                    //   'Please enter amount in USD',
                    //   style: TextStyle(color: Colors.white),
                    // )
                    // helperText will display down the field;
                    hintText: 'Please input amount in USD',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 228, 82, 82),
                        fontWeight: FontWeight.bold),
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    prefixIconColor: const Color.fromARGB(255, 228, 82, 82),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border),
              ),
            ),
            // TextButton(
            //     onPressed: () {
            //       debugPrint("Hello ");
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //           border: Border.all(style: BorderStyle.solid, width: 2),
            //           color: const Color.fromARGB(255, 228, 82, 82),
            //           borderRadius:
            //               const BorderRadius.all(Radius.circular(15))),
            //       alignment: Alignment.center,
            //       height: 40,
            //       width: 120,
            //       child: const Text(
            //         "Convert",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 30,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ))
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse((textEditingController.text)) * 81;
                  });
                },
                style: TextButton.styleFrom(
                    elevation: 20,
                    foregroundColor: const Color.fromARGB(255, 2, 2, 2),
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text(
                  "Convert",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyConverterMaterialPagee extends StatelessWidget {
  const CurrencyConverterMaterialPagee({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
