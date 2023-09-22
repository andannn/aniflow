import 'package:flutter/cupertino.dart';

Widget getFistPageTransaction(
    {required Animation<double> animation, required Widget child}) {
  return FadeTransition(
    opacity: animation,
    child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.ease)).animate(animation),
        child: child),
  );
}

Widget getSecondaryPageTransaction(
    {required Animation<double> animation, required Widget child}) {
  return FadeTransition(
    opacity: ReverseAnimation(animation),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.0, 0.0),
      ).chain(CurveTween(curve: Curves.easeIn)).animate(animation),
      child: child,
    ),
  );
}
