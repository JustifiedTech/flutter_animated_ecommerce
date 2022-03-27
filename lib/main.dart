import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_apt_task/utils/config/routes.dart';
import 'package:team_apt_task/utils/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const TeamApt());
}

class TeamApt extends StatelessWidget {
  const TeamApt({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeamApt',
      theme: Themes.themeData(),
      // home: const Welcome(),
      initialRoute: AppRoute.landing,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
