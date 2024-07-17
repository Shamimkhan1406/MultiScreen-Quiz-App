import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_2/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData,{super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = 
    itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(itemData['question_index']as int,isCorrectAnswer),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),

              ),
              const SizedBox(height: 5,),
              Text(
                itemData['user_answer'] as String,
                style: TextStyle(
                  color: isCorrectAnswer ? const Color.fromARGB(255, 42, 255, 49) 
                  : Colors.red,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 42, 255, 49),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}