import 'package:flutter/cupertino.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

extension NavigatorCustom<T> on BuildContext {
  void navigateTo(Widget widget, {bool removeStack = false}) {
    Navigator.push(
      this,
      CupertinoPageRoute(builder: (context) => widget),
    );
    if (removeStack) {
      Navigator.of(this).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => widget), (Route<dynamic> route) => false);
    }
  }

  void goBack() {
    Navigator.pop(this);
  }
}
