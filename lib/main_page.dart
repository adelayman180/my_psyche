import 'package:flutter/material.dart';
import './notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> listOfwidget = [];
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(10);
    firstOpen(i);
    sendNotifications(DateTime.now().add(Duration(seconds: 10)), i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.png'),
          ),
        ),
        child: SafeArea(
          minimum: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: listOfwidget),
              )),
              SizedBox(height: 4),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: controller,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Type a note ...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  FloatingActionButton(
                    mini: true,
                    child: Icon(Icons.send, color: Colors.white),
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      if (controller.text.trim() != '') {
                        setState(() {
                          addMynote(controller.text);
                        });
                        controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void firstOpen(int i) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      if ((pref.getBool('firstMain')) ?? true)
        listOfwidget.add(AdviceBody(
            'Before starting the challenges, one important point should be noted.\n'
            '- First, you should know that introversion and isolation are not benign traits of a human being'
            'By nature a social being, this means that man has energies and potentials that may be hidden'
            'And he can take it out at every moment to benefit from it with others'
            'I know that self-development takes time and at the same time requires commitment'
            'Apply what we will mention of simple behavioral methods, but their usefulness and feasibility are fully proven'));
    });
    pref.setBool('firstMain', false);
    listOfwidget.add(AdviceBody('Today `s Task'));
    addTask();
  }

  void addTask() {
    listOfwidget.add(Row(
      children: [
        AdviceBody(tasks[0]),
        ElevatedButton(
            onPressed: () {
              setState(() {
                listOfwidget.add(AdviceBody('Well done.'));
              });
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            child: Text(
              'Done??',
            ))
      ],
    ));
  }

  void addMynote(String txt) {
    listOfwidget.add(Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          margin: EdgeInsets.all(4),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ));
  }
}

class AdviceBody extends StatelessWidget {
  final txt;
  AdviceBody(this.txt);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          margin: EdgeInsets.all(4),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
