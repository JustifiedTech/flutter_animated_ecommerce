import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/routes.dart';

import '../../models/product.dart';
import '../../utils/config/constants.dart';
import '../../utils/config/size_config.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(AppRoute.details, arguments: product),
      child: Container(
        margin: EdgeInsets.only(
            right: getProportionateScreenWidth(15),
            left: getProportionateScreenWidth(10)),
        child: Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              height: getProportionateScreenHeight(420),
              width: getProportionateScreenWidth(230),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: getProportionateScreenHeight(80),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                padding: const EdgeInsets.only(left: 10),
                width: getProportionateScreenWidth(230),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.name.split(' ').first}\n${product.name.split(' ')[1]} ${product.name.split(' ').last}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: kWhiteColor),
                    ),
                    // const Space(
                    //   width: 90,
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: product.isFavourite
                            ? const Icon(Icons.favorite, color: kRed)
                            : const Icon(Icons.favorite_border_rounded,
                                color: kWhiteColor))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
