import 'dart:async';

import 'package:flutter/material.dart';
import 'package:team_apt_task/user_interface/components/default_card.dart';
import 'package:team_apt_task/utils/config/size_config.dart';

import '../../utils/config/constants.dart';
import '../../utils/config/enums.dart';
import '../components/bottom_navigation.dart';
import '../components/padded.dart';
import '../components/space.dart';
import 'chairs.dart';
import 'decor.dart';
import 'trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;


  int get tabIndex => _tabController.index;

  // int _selectedIndex = 0;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;
  late Animation<Offset> _bottomAnimation;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    Timer(const Duration(milliseconds: 500),
        () => _animationController.forward());

    _leftAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    ));

    _rightAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    ));
    _bottomAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    ));


  }

  void navigate(int index) {
    _tabController.animateTo(index);

  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padded(
            space: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideTransition(
                  position: _leftAnimation,
                  child: Text(
                    'Discover\nNew items',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(30),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Space(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: SlideTransition(
                      position: _leftAnimation,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search, size: 30),
                            filled: true,
                            fillColor: kWhiteColor,
                            hintText: 'Search products'),
                      ),
                    )),
                    const Space(
                      width: 12,
                    ),
                    SlideTransition(
                      position: _rightAnimation,
                      child: DefaultCard(
                        gradient: const LinearGradient(
                            colors: [kGreyColor2, kBlackColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        radius: 12,
                        // color: kBlackColor,
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/images/funnel.png',
                            fit: BoxFit.contain,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Space(height: 20),
                SlideTransition(
                  position: _leftAnimation,
                  child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w600),
                        labelColor: kContainerColor,
                        unselectedLabelColor: kLabelColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: kContainerColor,
                            width: 2,
                          ),
                          insets: EdgeInsets.only(
                            bottom: -2,
                            left: 15,
                            right: 15,
                          ),
                        ),
                        controller: _tabController,
                        tabs: const [
                          Text('Trending'),
                          Text('Chairs'),
                          Text('Decor')
                        ],
                      )),
                ),
                const Space(height: 20),
                Expanded(
                  // height: ,
                  child: SlideTransition(
                    position: _rightAnimation,
                    child: TabBarView(
                        controller: _tabController,
                        children: const [Trending(), Chairs(), Decor()]),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.home,
        controller: _bottomAnimation,
      ),
    );
  }
}
