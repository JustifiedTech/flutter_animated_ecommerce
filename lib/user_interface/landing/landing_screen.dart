import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/config/constants.dart';
import '../../utils/config/routes.dart';
import '../../utils/config/size_config.dart';
import '../components/padded.dart';
import '../components/space.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    Timer(const Duration(milliseconds: 300),
        () => _animationController.forward());

    _animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    Timer(const Duration(milliseconds: 200),
        () => _animationController2.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackground2,
      body: Stack(
        children: [
          Positioned(
            // width: double.maxFinite,
            right: 80,
            top: 233,
            child: SlideTransition(
              // opacity: _animationController,/
              position:
                  Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                  .animate(_animationController),
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 500, end: 10000),
                  duration: const Duration(seconds: 1),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: kContainerColor, shape: BoxShape.circle),
                      height: getProportionateScreenHeight(500),
                      width: getProportionateScreenWidth(500),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text.rich(
                                TextSpan(
                                  text:
                                      'Be faithful to your own taste, because\nnothing you really like is ever out of style.',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const Space(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                      AppRoute.home,
                                    ),
                                child: Image.asset(
                                    'assets/images/long-arrow-right.png'))
                          ]),
                    );
                  }
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SafeArea(
              child: Padded(
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                          begin: const Offset(-1, 0), end: Offset.zero)
                          .animate(_animationController2),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: 'Neo',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(36),
                                fontWeight: FontWeight.bold),
                            children: const [
                              TextSpan(
                                  text: 'Decor',
                                  style: TextStyle(color: kContainerColor))
                            ]),
                      ),
                      const Space(
                        height: 85,
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Let\'s\n',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(50),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                            children: const [
                              TextSpan(text: 'decor\n'),
                              TextSpan(
                                  text: 'your home',
                                  style: TextStyle(fontStyle: FontStyle.normal))
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
