import 'package:flutter/material.dart';
import 'package:team_apt_task/user_interface/components/circle_button.dart';
import 'package:team_apt_task/user_interface/components/padded.dart';
import 'package:team_apt_task/user_interface/components/space.dart';

import '../../models/product.dart';
import 'dart:async' show Timer;

import '../../utils/config/constants.dart';
import '../../utils/config/size_config.dart';
import '../components/build_dot.dart';
import '../components/button.dart';
import '../components/default_card.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentIndex = 0;

  List<Color> colors = [kGreenColor, kLabelColor, kPinkColor];

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: false);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        leading: CircleButton(
            icon: Icons.arrow_back_ios,
            onTap: () => Navigator.of(context).pop()),
      ),
      body: Padded(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                height: getProportionateScreenHeight(300),
                // width: getProportionateScreenWidth(300),
                child:
                    // PageView.builder(
                    ListView.builder(
                  // allowImplicitScrolling: true,
                  controller: _pageController,
                  // onPageChanged: _onPageChanged,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.product.items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.zero,
                      margin: const EdgeInsets.only(right: 10),
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(250),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.product.items[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Space(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //       widget.product.items.length,
            //       (index) =>
            //           BuildDot(currentIndex: _currentIndex, index: index)),
            // ),
            const Space(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.product.name.split(' ').first}\n${widget.product.name.split(' ')[1]} ${widget.product.name.split(' ').last}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kGreyColor2,
                      fontSize: 20,
                      height: 1.5),
                ),
                Text(
                  '\$${widget.product.price}',
                  style: const TextStyle(color: kGreyColor2, fontSize: 24),
                ),
              ],
            ),
            const Space(height: 10),
            const Text.rich(
              TextSpan(
                  text:
                      'ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional.'),
            ),
            const Space(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors[index],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CircleButton(onTap: () {}, icon: Icons.remove),
                    const DefaultCard(
                        radius: 10,
                        color: kGreyColor,
                        width: 50,
                        height: 30,
                        child: Text('88')),
                    CircleButton(onTap: () {}, icon: Icons.add),
                  ],
                ),
              ],
            ),
            const Space(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      width: 250,
                      text: 'Add to cart',
                      press: () {},
                      fillColor: kButtonColor,
                      color: kBlackColor,
                    ),
                    CircleButton(
                      icon: Icons.favorite_outline,
                      onTap: () {},
                    ),
                    // DefaultCard(
                    //   color: kBlackColor,
                    //   radius: 20,
                    //   height: 60,
                    //   width: 250,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 20.0, right: 10),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: const [
                    //         Text('Add to cart', style: TextStyle(color: kWhiteColor)),
                    //         CircleButton(
                    //           icon: Icons.add_shopping_cart,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
