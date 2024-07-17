import 'package:flutter/material.dart';
import 'package:udemy_2/data/questions.dart';
import 'package:udemy_2/questions_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswer,this.onRestart,{super.key,});
  final List<String> choosenAnswer;
  final void Function() onRestart;
  List <Map<String,Object>> getSummaryData()
  {
    final List <Map<String,Object>> summary = [];
    for(var i = 0; i < choosenAnswer.length; i++)
    {
      summary.add({
        'question_index':i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = questions.length;
    final correctAnswers = summaryData.where((item){
      return item['user_answer']==item['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $correctAnswers out of $totalQuestion Questions correctly!',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 15, 250, 226),
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}