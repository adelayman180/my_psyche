import 'package:flutter/material.dart';
import 'login_page.dart';

main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
    home: LoginPage(),
  ));
}
