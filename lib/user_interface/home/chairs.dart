import 'package:flutter/material.dart';

import '../../models/data.dart';
import 'list_view_item.dart';

class Chairs extends StatefulWidget {
  const Chairs({Key? key}) : super(key: key);

  @override
  State<Chairs> createState() => _ChairsState();
}

class _ChairsState extends State<Chairs> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListViewItem(
              item: Data(
            name: 'The King\'s Chair',
            image: 'assets/images/luxury-chair-2.jpeg',
            items: [''],
            isFavourite: true,
          ));
        });
  }
}
