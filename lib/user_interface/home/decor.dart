import 'package:flutter/material.dart';
import 'package:team_apt_task/models/data.dart';

import 'list_view_item.dart';

class Decor extends StatefulWidget {
  const Decor({Key? key}) : super(key: key);

  @override
  State<Decor> createState() => _DecorState();
}

class _DecorState extends State<Decor> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListViewItem(
              item: Data(
            name: 'Hi Interior Decor',
            image: 'assets/images/decor-2.jpeg',
            items: [''],
            isFavourite: true,
          ));
        });
  }
}
