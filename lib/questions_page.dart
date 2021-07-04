import 'package:flutter/material.dart';
import './questions.dart';
import './main_page.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int _index = 0;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/curve.png'),
                alignment: Alignment.bottomLeft)),
        child: SafeArea(
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _index,
            onStepTapped: (index) {
              setState(() {
                _index = index;
              });
            },
            controlsBuilder: (_, {onStepCancel, onStepContinue}) => Container(),
            steps: [
              for (int i = 0; i < 5; i++)
                Step(
                  isActive: _index == i ? true : false,
                  title: Text(''),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questions[i],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 40),
                      InkWell(
                        child: Text(
                          '- ' + goodAnswers[i],
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () => setState(() {
                          total++;
                          if (_index < 4) _index++;
                          if (_index == 4)
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => MainPage()));
                        }),
                      ),
                      SizedBox(height: 18),
                      InkWell(
                        child: Text(
                          '- ' + badAnswers[i],
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () => setState(() {
                          if (_index < 4) _index++;
                          if (_index == 4)
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => MainPage()));
                        }),
                      ),
                      SizedBox(height: 18),
                      Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Something else ?',
                              suffix: TextButton(
                                onPressed: () => setState(() {
                                  if (_index < 4) _index++;
                                }),
                                child: Text('Enter'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
