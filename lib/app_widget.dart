import 'package:flutter/material.dart';
import 'package:ta_caro/modules/feed/feed_page.dart';
import 'package:ta_caro/modules/home/home_page.dart';
import 'package:ta_caro/modules/login/login_page.dart';
import 'package:ta_caro/modules/login/pages/create_account/create_account_page.dart';
import 'package:ta_caro/modules/profile/profile.page.dart';
import 'package:ta_caro/modules/splash/splash_page.dart';
import 'package:ta_caro/shared/models/user_model.dart';

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
        "/login/create-account": (context) => const CreateAccountPage(),
        "/home": (context) => HomePage(
              pages: [FeedPage(), ProfilePage()],
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            )
      },
    );
  }
}
