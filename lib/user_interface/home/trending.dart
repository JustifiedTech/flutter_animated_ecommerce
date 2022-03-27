import 'package:flutter/material.dart';

import '../../utils/config/constants.dart';
import '../../utils/config/size_config.dart';
import '../components/default_card.dart';

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
          return Container(
            margin: EdgeInsets.only(
                right: getProportionateScreenWidth(15),
                left: getProportionateScreenWidth(10)),
            child: Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: getProportionateScreenHeight(420),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/noom-candle-holder.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Noom \nCandle Holders',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kWhiteColor),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_rounded,
                            color: kWhiteColor))
                  ],
                )
              ],
            ),
          );
        });
  }
}
