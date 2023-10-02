import 'package:animted_app_rive/models/rive_assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.press,
    required this.riveonInIt,
    required this.isActive,
  });
  final RiveAssets menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInIt;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
        ListTile(
          onTap: press,
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset(
              menu.src,
              artboard: menu.artboard,
              onInit: riveonInIt,
            ),
          ),
          title: Text(
            menu.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
