// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show_balance_clicked = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const color = Color.fromARGB(255, 9, 91, 109);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.035,
                  ),
                  const ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Color.fromARGB(82, 149, 209, 223),
                          child: CircleAvatar(
                            radius: 20,
                            foregroundColor: Color.fromARGB(255, 9, 91, 109),
                            child: Text('HC'),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      'Hi, Himanshu',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          height: height * 0.30,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(82, 149, 209, 223),
                              borderRadius: BorderRadius.circular(20)),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.remove_red_eye,
                                    color: color,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          show_balance_clicked =
                                              !show_balance_clicked;
                                          // '₹***********';
                                        });
                                      },
                                      child: const Text(
                                          'Tap here to view/hide balance'))
                                ],
                              ),
                            ),
                          )),
                      Container(
                        height: height * 0.25,
                        width: width,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.only(right: width * 0.016),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.1,
                                  child: const Text(
                                    'My Cards',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.25,
                        width: width * 0.84,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.remove_red_eye,
                                color: color,
                              ),
                              title: const Text(
                                'Savings ****3089',
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: const Text(
                                'Mardah, Uttar Pradesh',
                                style: TextStyle(fontSize: 14),
                              ),
                              trailing: Container(
                                height: height * 0.0350,
                                width: width * 0.22,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        182, 186, 236, 179),
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Center(
                                  child: Text(
                                    'PRIMARY',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 7, 150, 7)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.0250,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05),
                              child: Container(
                                height: height * 0.0350 * 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      const Color.fromARGB(82, 149, 209, 223),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'A/C BALANCE',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          show_balance_clicked
                                              ? '₹7,869.82'
                                              : '₹***********',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transaction',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'M-Passbook',
                        style: TextStyle(
                            color: Color.fromARGB(255, 50, 152, 174),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  const transaction_row_widget(
                    date: '12 Sep 2023',
                    transactionDetails:
                        'UPI/325575067403/DR/\nVicky/UTIB/880802023..',
                    amount: '245',
                    totalBalance: '7869.82',
                  ),
                  const transaction_row_widget(
                    date: '12 Sep 2023',
                    transactionDetails:
                        'UPI/325582043695/DR/\nGOVIND/HDFC/govi..',
                    amount: '15',
                    totalBalance: '8114.82',
                  ),
                  const transaction_row_widget(
                    date: '12 Sep 2023',
                    transactionDetails:
                        'UPI/325515560634/DR/\nGOVIND/HDFC/govi..',
                    amount: '90',
                    totalBalance: '8129.82',
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Quick Actions',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      quick_action_widget(
                        icon: Icon(
                          Icons.qr_code,
                          color: color,
                          size: 32,
                        ),
                        action_name: 'Bank',
                      ),
                      quick_action_widget(
                        icon: Icon(
                          Icons.person,
                          color: color,
                          size: 32,
                        ),
                        action_name: 'Self',
                      ),
                      quick_action_widget(
                        icon: Icon(
                          Icons.man,
                          color: color,
                          size: 32,
                        ),
                        action_name: 'NPS',
                      ),
                      quick_action_widget(
                        icon: Icon(
                          Icons.wallet,
                          color: color,
                          size: 32,
                        ),
                        action_name: 'PPF',
                      ),
                      quick_action_widget(
                        icon: Icon(
                          Icons.local_post_office,
                          color: color,
                          size: 32,
                        ),
                        action_name: 'Government',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: height * 0.10,
            decoration: const BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Divider(
                    color: Colors.white,
                    thickness: 5,
                    indent: 175,
                    endIndent: 175,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bottom_quick_tabs(
                        iconData: Icons.currency_rupee,
                        quick_tab_name: 'Pay',
                      ),
                      bottom_quick_tabs(
                        iconData: Icons.savings_outlined,
                        quick_tab_name: 'Savings',
                      ),
                      bottom_quick_tabs(
                        iconData: Icons.money,
                        quick_tab_name: 'Borrow',
                      ),
                      bottom_quick_tabs(
                        iconData: Icons.arrow_upward,
                        quick_tab_name: 'Invest',
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class bottom_quick_tabs extends StatelessWidget {
  final IconData iconData;
  final String quick_tab_name;
  const bottom_quick_tabs(
      {super.key, required this.iconData, required this.quick_tab_name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.0350,
      width: MediaQuery.of(context).size.width * 0.22,
      decoration: BoxDecoration(
          color: const Color.fromARGB(62, 21, 186, 223),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          Text(
            ' ${quick_tab_name}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}

class quick_action_widget extends StatelessWidget {
  final Icon icon;
  final String action_name;
  const quick_action_widget(
      {super.key, required this.icon, required this.action_name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            icon,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.010,
            ),
            Text(action_name),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.020,
        )
      ],
    );
  }
}

class transaction_row_widget extends StatelessWidget {
  final String date;
  final String transactionDetails;
  final String amount;
  final String totalBalance;
  const transaction_row_widget(
      {super.key,
      required this.date,
      required this.transactionDetails,
      required this.amount,
      required this.totalBalance});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(transactionDetails),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${amount}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('₹${totalBalance}'),
                  ],
                ),
                const Icon(
                  Icons.arrow_outward,
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        )
      ],
    );
  }
}
