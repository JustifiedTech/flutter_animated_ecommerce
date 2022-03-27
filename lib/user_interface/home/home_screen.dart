import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/size_config.dart';

import '../../utils/config/enums.dart';
import '../components/bottom_navigation.dart';
import '../components/padded.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padded(
            space: 24,
            child: Column(
              children: [
                Text(
                  'Discover\nNew items',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
