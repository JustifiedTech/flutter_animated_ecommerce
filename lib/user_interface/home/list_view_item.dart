import 'package:flutter/material.dart';

import '../../models/data.dart';
import '../../utils/config/constants.dart';
import '../../utils/config/size_config.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key, required this.item}) : super(key: key);
  final Data item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: getProportionateScreenWidth(15),
          left: getProportionateScreenWidth(10)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            height: getProportionateScreenHeight(420),
            width: getProportionateScreenWidth(230),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              padding: const EdgeInsets.only(left: 10),
              width: getProportionateScreenWidth(230),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item.name.split(' ').first}\n${item.name.split(' ')[1]} ${item.name.split(' ').last}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: kWhiteColor),
                  ),
                  // const Space(
                  //   width: 90,
                  // ),
                  IconButton(
                      onPressed: () {},
                      icon: item.isFavourite
                          ? const Icon(Icons.favorite, color: kRed)
                          : const Icon(Icons.favorite_border_rounded,
                              color: kWhiteColor))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
