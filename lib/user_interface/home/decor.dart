import 'package:flutter/material.dart';
import 'package:team_apt_task/models/product.dart';

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
        itemCount: decors.length,
        itemBuilder: (context, index) {
          final decor = decors[index];

          return ListViewItem(product: decor);
        });
  }
}
