import 'package:flutter/material.dart';
import 'package:team_apt_task/models/product.dart';
import 'package:team_apt_task/user_interface/cart/cart_screen.dart';
import 'package:team_apt_task/user_interface/components/navigation_builder.dart';
import 'package:team_apt_task/user_interface/favourite/favourite_screen.dart';
import 'package:team_apt_task/user_interface/home/home_screen.dart';
import 'package:team_apt_task/user_interface/landing/landing_screen.dart';
import 'package:team_apt_task/user_interface/product_details/product_detail_screen.dart';


class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case landing:
        return NavigationBuilder(
            child: const LandingScreen(), settings: settings);
      case home:
        return NavigationBuilder(child: const HomeScreen(), settings: settings);
      case details:
        final product = settings.arguments as Product;
        return NavigationBuilder(
            isScale: false,
            direction: AxisDirection.up,
            child: ProductDetailScreen(
              product: product,
            ),
            settings: settings);
      case favourite:
        return NavigationBuilder(
            child: const FavouriteScreen(), settings: settings);
      case cart:
        return NavigationBuilder(child: const CartScreen(), settings: settings);
      default:
        return NavigationBuilder(
            child: const LandingScreen(), settings: settings);
    }
  }

  static const String home = '/home';
  static const String landing = '/landing';
  static const String details = '/details';
  static const String favourite = '/favourite';
  static const String cart = '/cart';
}
