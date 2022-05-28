import 'package:flutter/material.dart';
import 'package:quize/question.dart';
import 'package:quize/quize_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> iconsConfirm = [];
  void checkAnswer(bool pickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Completed',
          desc: 'You\'ve Finished the quize!.',
        ).show();
        quizBrain.reset();
        iconsConfirm = [];
      } else {
        if (pickedAnswer == correctAnswer) {
          iconsConfirm.add(const Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
        } else {
          iconsConfirm.add(const Icon(
            Icons.close_rounded,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Expanded(
          flex: 2,
          child: Padding(
            padding:EdgeInsets.only(top: 30) ,
            child:Text
          ("Welcome To Quize Game",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),) ,)
          ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
               checkAnswer(true);
              },
              child: const Text(
                "True",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                "False",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children:
          iconsConfirm  )
      ],
    );
  }
}
