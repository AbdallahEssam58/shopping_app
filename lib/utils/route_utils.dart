import 'package:flutter/material.dart';

Route fadeRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, anim1, anim2) => page,
    transitionsBuilder: (context, anim, secAnim, child) =>
        FadeTransition(opacity: anim, child: child),
    transitionDuration: const Duration(milliseconds: 400),
  );
}
