import 'package:flutter/material.dart';

push(BuildContext context, Widget page, bool replacement,
    {int duration = 350}) {
  PageRouteBuilder pageRouter = PageRouteBuilder(
    transitionDuration: Duration(milliseconds: duration),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    pageBuilder: (_, __, ___) => page,
  );

  if (replacement) return Navigator.pushReplacement(context, pageRouter);

  return Navigator.push(context, pageRouter);
}

pop<T extends Object>(context, [T result]) {
  Navigator.pop(context, result);
}
