import 'package:flutter/material.dart';

import '../../utils/config/constants.dart';
import '../../utils/config/routes.dart';
import '../../utils/config/size_config.dart';
import '../components/padded.dart';
import '../components/space.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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
            child: Container(
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
                        child:
                            Image.asset('assets/images/long-arrow-right.png'))
                  ]),
            ),
          ),
          Positioned(
            top: 0,
            child: SafeArea(
              child: Padded(
                child: AnimatedContainer(
                  duration: kAnimationDuration,
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
