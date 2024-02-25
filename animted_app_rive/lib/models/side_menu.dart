import 'package:animted_app_rive/models/info_card.dart';
import 'package:animted_app_rive/models/rive_assets.dart';
import 'package:animted_app_rive/models/side_menu_tile.dart';
import 'package:animted_app_rive/screens/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAssets selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: 288,
          color: const Color(0xff17203a),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: 'Himanshu Chaurasiya',
                profession: 'Flutter Developer',
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Browse',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ...sideMenus.map((menu) => SideMenuTile(
                    menu: menu,
                    riveonInIt: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI('active') as SMIBool;
                    },
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(const Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });
                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    isActive: selectedMenu == menu,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
