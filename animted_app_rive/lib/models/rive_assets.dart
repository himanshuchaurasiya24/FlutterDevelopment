import 'package:rive/rive.dart';

class RiveAssets {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  RiveAssets(
      {required this.src,
      required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAssets> bottomNavs = [
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'CHAT',
      stateMachineName: 'CHAT_Interactivity',
      title: 'Chat'),
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
      title: 'Search'),
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
      title: 'Timer'),
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'BELL',
      stateMachineName: 'BELL_Interactivity',
      title: 'Notification'),
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'USER',
      stateMachineName: 'USER_Interactivity',
      title: 'Profile'),
];
List<RiveAssets> sideMenus = [
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'HOME',
      stateMachineName: 'HOME_Interactivity',
      title: 'Home'),
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
      title: 'Search'),
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'LIKE/STAR',
      stateMachineName: 'STAR_Interactivity',
      title: 'Favorites'),
  RiveAssets(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'CHAT',
      stateMachineName: 'CHAT_Interactivity',
      title: 'Help'),
];
