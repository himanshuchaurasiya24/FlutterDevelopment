import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    Key? key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  })  : _btnAnimationController = btnAnimationController,
        super(key: key);
  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   print('btn clicked!!');
      //   _btnAnimationController.isActive = true;
      // },
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(children: [
          RiveAnimation.asset(
            'assets/RiveAssets/button.riv',
            controllers: [_btnAnimationController],
          ),
          const Positioned.fill(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.arrow_right),
              SizedBox(
                width: 8,
              ),
              Text(
                'Start the course',
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
