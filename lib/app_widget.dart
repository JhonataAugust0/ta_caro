import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/login_page.dart';
import 'package:ta_caro/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter #1',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
      },
    );
  }
}
