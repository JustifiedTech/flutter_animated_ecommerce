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
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int get tabIndex => _tabController.index;

  // int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  void navigate(int index) {
    _tabController.animateTo(index);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
                Text(
                  'Discover\nNew items',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.bold),
                ),
                const Space(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, size: 30),
                          filled: true,
                          fillColor: kWhiteColor,
                          hintText: 'Search products'),
                    )),
                    const Space(
                      width: 12,
                    ),
                    const DefaultCard(
                      gradient: LinearGradient(
                          colors: [kGreyColor2, kBlackColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      radius: 12,
                      // color: kBlackColor,
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.water_drop_outlined,
                        size: 30,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
                const Space(height: 20),
                DefaultTabController(
                    length: 3,
                    child: TabBar(
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
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
                const Space(height: 20),
                Expanded(
                  // height: ,
                  child: TabBarView(
                      controller: _tabController,
                      children: const [Trending(), Chairs(), Decor()]),
                ),
              ],
            )),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
