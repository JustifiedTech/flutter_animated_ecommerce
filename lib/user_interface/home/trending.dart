import 'package:flutter/material.dart';
import 'package:team_apt_task/user_interface/home/list_view_item.dart';

import '../../models/data.dart';
import '../../utils/config/constants.dart';
import '../../utils/config/size_config.dart';
import '../components/default_card.dart';
import '../components/space.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListViewItem(
              item: Data(
            name: 'Hi John Terry',
            image: 'assets/images/noom-candle-holder.jpeg',
            items: [''],
            isFavourite: true,
          ));
        });
  }
}

