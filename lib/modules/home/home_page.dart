import 'package:flutter/material.dart';
import 'package:ta_caro/modules/create/creae_bottomsheet.dart';
import 'package:ta_caro/modules/feed/feed_page.dart';
import 'package:ta_caro/shared/theme/app_theme.dart';
import 'package:ta_caro/widgets/bottom_navigator/app_bottom_navigator.dart';

class HomePage extends StatefulWidget {
  final List<Widget> pages;
  const HomePage({Key? key, required this.pages}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  void changeIndex(int index) {
    if (index == 3) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          context: context,
          builder: (context) => CreateBottomSheet());
    } else {
      currentIndex = index;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            widget.pages[currentIndex],
            Positioned(
              bottom: 14,
              left: 26,
              right: 26,
              child: AppBottomNavigator(
                currentIndex: currentIndex,
                onChanged: changeIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
