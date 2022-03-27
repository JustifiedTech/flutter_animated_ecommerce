import 'package:flutter/material.dart';
import 'package:team_apt_task/user_interface/home/list_view_item.dart';

import '../../models/product.dart';


class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: candles.length,
        itemBuilder: (context, index) {
          final candle = candles[index];
          return ListViewItem(
            product: candle,
          );
        });
  }
}

