import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login_page.dart';
import './main_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
    getPage();
  }

  getPage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool firstOpen = pref.getBool('firstOpen') ?? true;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => firstOpen ? LoginPage() : MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
