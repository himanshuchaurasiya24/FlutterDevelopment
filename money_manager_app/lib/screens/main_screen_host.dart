import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/home_profile_tab.dart';
import 'package:money_manager_app/screens/home_screen_tab.dart';
import 'package:money_manager_app/utils/constants.dart';

class MainScreenHost extends StatefulWidget {
  const MainScreenHost({super.key});

  @override
  State<MainScreenHost> createState() => _MainScreenHostState();
}

class _MainScreenHostState extends State<MainScreenHost> {
  var currentIndex = 0;
  Widget buildTabContent(int index) {
    switch (index) {
      case 0:
        return const HomeScreenTab();
      case 1:
        return const HomeProfileTab();
      case 2:
        return const HomeScreenTab();
      case 3:
        return const HomeProfileTab();
      default:
        return const HomeScreenTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: accent,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: secondaryDark,
        unselectedItemColor: fontLight,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home-1.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/chart-vertical.png'),
            label: 'State',
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/wallet.png'), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/user-1.png'), label: 'Profile'),
        ],
      ),
      body: buildTabContent(currentIndex),
    );
  }
}
