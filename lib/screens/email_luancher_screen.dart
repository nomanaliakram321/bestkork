import 'package:bestkrok_easykrok/repository/all_repository.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:toast/toast.dart';
class EmailLauncherScreen extends StatefulWidget {
  const EmailLauncherScreen({Key key}) : super(key: key);

  @override
  _EmailLauncherScreenState createState() => _EmailLauncherScreenState();
}

class _EmailLauncherScreenState extends State<EmailLauncherScreen> {
  final _dialog = RatingDialog(

    // your app's name?
    title: 'Rate This App',
    // encourage your user to leave a high rating?
    ratingColor: Colors.green,
    message:
    'Tap a star to set your rating.',
    // your app's logo?
    image: Image.asset(
      'images/logo.png',
      fit: BoxFit.fill,
    ),
    submitButton: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        Container();
      }
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
    child: RaisedButton.icon(
    color: Colors.green[500],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => _dialog,
          );
        },
        icon: Icon(
          Icons.star,
          color: Colors.white,
        ),
        label: Text(
          "Rate APP",
          style: TextStyle(color: Colors.white),
        )
    ),
    ));

  }


}
