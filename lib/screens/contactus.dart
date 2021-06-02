import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:toast/toast.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: CIcon(
                  IconMoon.icon_email,
                  color: Colors.green[500],
                ),
                title: Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Bestkrok@gmail.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                trailing: IconButton(
                    icon: CIcon(
                      IconMoon.icon_copy1,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      FlutterClipboard.copy('Bestkrok@gmail.com').then(
                          (value) => showToast("Bestkrok@gmail.com copied",
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM));
                    }),
              ),
              Divider(),
              ListTile(
                trailing: IconButton(
                    icon: CIcon(
                      IconMoon.icon_copy1,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      FlutterClipboard.copy('+380 93 2 51 51 51').then(
                          (value) => showToast("+380 93 2 51 51 51",
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM));
                    }),
                leading: CIcon(
                  IconMoon.icon_whatsapp1,
                  color: Colors.green[500],
                ),
                title: Text(
                  'WhatsaApp',
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '+380 93 2 51 51 51',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                trailing: IconButton(
                    icon: CIcon(
                      IconMoon.icon_copy1,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      FlutterClipboard.copy('+380 93 2 51 51 51').then(
                          (value) => showToast("+380 93 2 51 51 51",
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM));
                    }),
                leading: CIcon(
                  IconMoon.icon_viber,
                  color: Colors.green[500],
                  size: 30,
                ),
                title: Text(
                  'viber',
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '+380 93 2 51 51 51',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                trailing: IconButton(
                    icon: CIcon(
                      IconMoon.icon_copy1,
                      color: Colors.green[500],
                    ),
                    onPressed: () {
                      FlutterClipboard.copy('+380 93 2 51 51 51').then(
                          (value) => showToast("+380 93 2 51 51 51",
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM));
                    }),
                leading: CIcon(
                  IconMoon.icon_telegram1,
                  color: Colors.green[500],
                ),
                title: Text(
                  'Telegram',
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '+380 93 2 51 51 51',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                trailing: IconButton(
                    icon: CIcon(
                      IconMoon.icon_copy1,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      FlutterClipboard.copy('t.me/bestkrok').then((value) =>
                          showToast("t.me/bestkrok Copied",
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM));
                    }),
                leading: Icon(
                  Icons.local_pharmacy,
                  color: Colors.green[500],
                ),
                title: Text(
                  'Pharma',
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    ' t.me/bestkrok',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                trailing: IconButton(
                    icon: CIcon(
                      IconMoon.icon_copy1,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      FlutterClipboard.copy(
                              't.me/Krok1_Pharma \n t.me/Krok1_Pharma')
                          .then((value) => showToast(
                              't.me/Krok1_Pharma \n t.me/Krok1_Pharma',
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM));
                    }),
                leading: Icon(
                  Icons.local_pharmacy_outlined,
                  color: Colors.green[500],
                ),
                title: Text(
                  'Krok-1/Krok-2',
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        't.me/Krok1_Pharma',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        't.me/Krok1_Pharma',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: duration,
        gravity: gravity,
        backgroundColor: Colors.white,
        textColor: Colors.green[500]);
  }
}

// Email: Bestkrok@gmail.com

// WhatsApp/Telegram/Viber
// +380 93 2 51 51 51

// Pharma:  t.me/bestkrok
// Krok-1: t.me/Krok1_Pharma
// Krok-2: t.me/Krok2_Pharma
