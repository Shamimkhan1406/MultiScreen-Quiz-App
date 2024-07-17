import 'package:flutter/material.dart';
import 'package:udemy_2/answer_button.dart';
import 'package:udemy_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer,{super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer)
  {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
    //currentQuestionIndex = currentQuestionIndex+1;
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
              style: GoogleFonts.chakraPetch(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40,),
            ...currentQuestion.shuffledAnswer().map((item){
              return AnswerButton(item,(){
                answerQuestion(item);
              });
            })
            // AnswerButton(currentQuestion.answers[0], () { }),
            // AnswerButton(currentQuestion.answers[1], () { }),
            // AnswerButton(currentQuestion.answers[2], () { }),
            // AnswerButton(currentQuestion.answers[3], () { }),
          ],
        ),
      ),
    );
  }
}