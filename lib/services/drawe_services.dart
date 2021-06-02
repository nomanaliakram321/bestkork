import 'package:bestkrok_easykrok/screens/contactus.dart';
import 'package:bestkrok_easykrok/screens/all_category_screen.dart';
import 'package:bestkrok_easykrok/screens/language_screen.dart';
import 'package:bestkrok_easykrok/screens/main_screen.dart';
import 'package:bestkrok_easykrok/screens/more_app_screens.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DrawerServices {
  Widget drawerservices(title) {
    if (title == 'Best Krok MCQs App') {
      return CategoryScreen();
    }
    if (title == 'All Categories') {
      return CategoryScreen();
    }
    if (title == 'Language') {
      return LanguageScreen();
    }
    if (title == 'More Apps') {
      return MoreAppScreen();
    }
    if (title == 'Share Your Friend') {
      return ShareApp();
    }
    if (title == 'Contact Us') {
      return ContactUsScreen();
    }
    if (title == 'Feedback') {
      return CategoryScreen();
    }
  }
}

class ShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton.icon(
            color: Colors.green[500],
            onPressed: () {
              final String url =
                  "http//path your app on google play or app store ";
              final RenderBox box = context.findRenderObject();
              Share.share(url,
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
            },
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            label: Text(
              "Share APP",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
