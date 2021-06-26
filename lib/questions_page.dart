import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset('images/curve.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Question ??',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                padding: EdgeInsets.all(30),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (_, i) => Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white24,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Answer ${i + 1}',
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
