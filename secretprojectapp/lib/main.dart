import 'package:flutter/material.dart';
import 'package:secretprojectapp/pages/home_page.dart';
import 'package:secretprojectapp/pages/mail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secret Project App',
      routes: {
        '/' : (context) => HomePage(),
        HomePage.routeName : (context) => HomePage(),
        MailPage.routeName : (context) => MailPage()
      },
    );
  }
}