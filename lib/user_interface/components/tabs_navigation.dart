import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/constants.dart';

import '../../utils/config/size_config.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(
      {Key? key,
      required this.first,
      required this.second,
      required this.third,
      required this.fourth,
      required this.bottomNav,
      this.others,
      this.title})
      : super(key: key);
  final Widget bottomNav, first, second, third, fourth;
  final String? title;
  final List<Widget>? others;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int get tabIndex => tabController.index;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  void navigate(int index) {
    tabController.animateTo(index);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: 'New',
            ),
            Tab(
              text: 'Accepted',
            ),
            Tab(
              text: 'History',
            )
          ],
          indicatorColor: kLightGreen,
          indicatorWeight: 3,
          labelColor: kLightGreen,
          unselectedLabelColor: kGreyColor,
          labelStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(16)),
          unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      body: Column(
        children: [
          ...?widget.others,
          TabBarView(
            controller: tabController,
            children: [
              widget.first,
              widget.second,
              widget.third,
              widget.fourth
            ],
          ),
        ],
      ),
      bottomNavigationBar: widget.bottomNav,
    );
  }
}
