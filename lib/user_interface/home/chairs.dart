import 'package:flutter/material.dart';

import '../../models/product.dart';
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
        itemCount: chairs.length,
        itemBuilder: (context, index) {
          final chair = chairs[index];

          return ListViewItem(
              product: chair);
        });
  }
}
