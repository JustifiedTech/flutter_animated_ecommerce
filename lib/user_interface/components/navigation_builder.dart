import 'package:flutter/material.dart';

class NavigationBuilder extends PageRouteBuilder {
  NavigationBuilder(
      {required this.child,
      this.isScale = true,
      RouteSettings? settings,
      this.direction = AxisDirection.up})
      : super(
          // transitionsBuilder: ,
          settings: settings,
          reverseTransitionDuration: const Duration(seconds: 1),
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  final Widget child;
  final bool isScale;
  final AxisDirection direction;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      isScale
          ? ScaleTransition(scale: animation, child: child)
          : SlideTransition(
              position: Tween<Offset>(
                begin: getDirection(),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );

  Offset getDirection() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
