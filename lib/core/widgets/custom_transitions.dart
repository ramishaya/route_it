import 'package:flutter/cupertino.dart';

// this class is for handling and managing the pages transitions in the app like animated transition etc...
class CustomTransitions {
  static Widget slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0), // Bottom to Top
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
