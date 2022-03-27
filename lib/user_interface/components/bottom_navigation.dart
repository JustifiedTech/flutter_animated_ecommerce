import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/routes.dart';

import '../../utils/config/constants.dart';
import '../../utils/config/enums.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedMenu, this.padding = 10})
      : super(key: key);

  final MenuState selectedMenu;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Container(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                navs.length,
                (index) {
                  final nav = navs[index];
                  return BottomNav(
                      selectedMenu: selectedMenu,
                      selected: nav['selected'],
                      icon: nav['icon'],
                      goto: nav['goto']);
                },
              ),
            ),
          )),
    );
  }
}

List<Map<String, dynamic>> navs = [
  {
    'selected': MenuState.home,
    'icon': Icons.home,
    'goto': AppRoute.home,
  },
  {
    'selected': MenuState.favourite,
    'icon': Icons.favorite_outline,
    'goto': AppRoute.favourite
  },
  {
    'selected': MenuState.cart,
    'icon': Icons.shopping_cart,
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
        ),
        onPressed: () => Navigator.of(context).pushReplacementNamed(goto));
  }
}
