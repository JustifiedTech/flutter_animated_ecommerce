import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/routes.dart';

import '../../utils/config/constants.dart';
import '../../utils/config/enums.dart';
import '../../utils/config/size_config.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedMenu, this.padding = 10})
      : super(key: key);

  final MenuState selectedMenu;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Container(
            height: getProportionateScreenHeight(65),
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: kDarkColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: navs
                    .asMap()
                    .entries
                    .map((nav) => BottomNav(
                        selectedMenu: selectedMenu,
                        selected: nav.value['selected'],
                        icon: nav.value['icon'],
                        goto: nav.value['goto']))
                    .toList()
            ),
          )),
    );
  }
}

List<Map<String, dynamic>> navs = [
  {
    'selected': MenuState.home,
    'icon': Icons.home_outlined,
    'goto': AppRoute.home,
  },
  {
    'selected': MenuState.favourite,
    'icon': Icons.favorite_outline,
    'goto': AppRoute.favourite
  },
  {
    'selected': MenuState.cart,
    'icon': Icons.shopping_cart_outlined,
    'goto': AppRoute.cart
  },
];

class BottomNav extends StatelessWidget {
  const BottomNav(
      {Key? key,
      required this.selectedMenu,
      required this.selected,
      required this.icon,
      this.goto = AppRoute.landing})
      : super(key: key);

  final MenuState selectedMenu;
  final MenuState selected;
  final String goto;
  final IconData icon;
  // final Str goto;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          icon,
          color: selected == selectedMenu ? kPrimaryColor : kWhiteColor,
          size: 30,
        ),
        onPressed: () => Navigator.of(context).pushReplacementNamed(goto));
  }
}
