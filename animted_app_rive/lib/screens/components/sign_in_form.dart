import 'package:animted_app_rive/screens/entry_point.dart';
import 'package:animted_app_rive/screens/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;
  // StateMachineController getRiveController(Artboard artboard) {
  //   StateMachineController? controller =
  //       StateMachineController.fromArtboard(artboard, "State Machine 1");
  //   artboard.addController(controller!);
  //   return controller;
  // }

  bool isShowLoading = false;
  bool isShowConfetti = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  }
                  return null;
                },
                onSaved: (email) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/icons/email.svg'),
                  ),
                ),
              ),
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  }
                  return null;
                },
                onSaved: (password) {},
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/icons/password.svg'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: ElevatedButton.icon(
                onPressed: () {
                  signIn(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  backgroundColor: const Color(0xFFF77D8E),
                ),
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Color(0xfffe0037),
                ),
                label: const Text("Sign In"),
              ),
            ),
          ],
        ),
      ),
      isShowLoading
          ? CustomPositioned(
              child: RiveAnimation.asset(
                'assets/RiveAssets/check.riv',
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard);
                  check = controller.findSMI('Check');
                  error = controller.findSMI('Error');
                  reset = controller.findSMI('Reset');
                },
              ),
            )
          : const SizedBox(),
      CustomPositioned(
        child: Transform.scale(
          scale: 10,
          child: RiveAnimation.asset(
            'assets/RiveAssets/confetti.riv',
            onInit: (artboard) {
              StateMachineController controller =
                  RiveUtils.getRiveController(artboard);
              confetti = controller.findSMI('Trigger explosion') as SMITrigger;
            },
          ),
        ),
      ),
    ]);
  }

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;

      isShowConfetti = true;
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formkey.currentState!.validate()) {
          check.fire();
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isShowLoading = false;
            });
            confetti.fire();
          });
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const EntryPoint();
            }));
          });
        } else {
          error.fire();
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isShowLoading = false;
            });
          });
        }
      },
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});
  final Widget child;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
