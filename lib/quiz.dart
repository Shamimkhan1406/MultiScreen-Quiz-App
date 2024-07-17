import 'package:flutter/material.dart';
import 'package:udemy_2/background.dart';
import 'package:udemy_2/data/questions.dart';
import 'package:udemy_2/question_screen.dart';
import 'package:udemy_2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'background';
  //Widget? activeScreen;
  // void initState() {
  //   activeScreen  = Background(switchScreen); 
  //   super.initState();
  // }
  void switchScreen()
  {
    setState(() {
      activeScreen = 'questionScreen';
      //activeScreen = const QuestionScreen();
    });
  }
  void chooseAnswer(String answer)
  {
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length)
    {
      setState(() {
        //selectedAnswer = [];
        activeScreen = 'result-screen';
      });
      
    }
  }
  void restartQuiz()
  {
    setState(() {
      selectedAnswer=[];
      activeScreen = 'questionScreen';
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Background(switchScreen);

    if(activeScreen == 'questionScreen')
    {
      screenWidget=QuestionScreen(chooseAnswer);
    }
    else if(activeScreen == 'result-screen')
    {
      screenWidget = ResultScreen(selectedAnswer,restartQuiz);
    }
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ Colors.pinkAccent,Color.fromRGBO(244, 169, 242, 1), Colors.orangeAccent],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          // activeScreen== 'background'
          //   ? Background(switchScreen)
          //   : QuestionScreen(chooseAnswer),
        ),
      ),
    );
  }
}