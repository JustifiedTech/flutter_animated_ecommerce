import 'package:flutter/material.dart';
import 'package:team_apt_task/user_interface/components/circle_button.dart';
import 'package:team_apt_task/user_interface/components/padded.dart';
import 'package:team_apt_task/user_interface/components/space.dart';

import '../../models/product.dart';
import 'dart:async' show Timer;

import '../../utils/config/constants.dart';
import '../../utils/config/size_config.dart';
import '../components/button.dart';
import '../components/default_card.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  int selectedColor = 0;
  int counter = 0;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    Timer(const Duration(milliseconds: 500),
        () => _animationController.forward());
    // _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Color> colors = [kGreenColor, kGreyColor, kPinkColor];

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
            SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                      .animate(CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.bounceInOut)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: getProportionateScreenHeight(300),
                  child: ListView.builder(
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
            Text.rich(
              TextSpan(text: widget.product.description),
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
                    (index) => InkWell(
                      onTap: () => setState(() {
                        selectedColor = index;
                      }),
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: index == selectedColor
                              ? Border.all(width: 5, color: kLabelColor)
                              : null,
                          color: colors[index],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CircleButton(
                        onTap: () {
                          if (counter > 0) {
                            setState(() {
                              counter -= 1;
                            });
                          }
                        },
                        icon: Icons.remove),
                    DefaultCard(
                        radius: 10,
                        color: kGreyColor,
                        width: 50,
                        height: 30,
                        child: Text('$counter')),
                    CircleButton(
                        onTap: () => setState(() {
                              counter += 1;
                            }),
                        icon: Icons.add),
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
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
