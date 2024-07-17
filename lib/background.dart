import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(this.startQuiz, {super.key});
  final void Function() startQuiz;//variable

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/questionmark.png',width: 200,color: const Color.fromARGB(109, 0, 0, 0),),
          Image.asset('assets/images/flutterIcon.png',width: 150,color: const Color.fromARGB(116, 0, 0, 0),),
          const SizedBox(height: 30,),
          const Text('Learn Flutter the fun way !',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),),
          const SizedBox(height: 50,),
          OutlinedButton.icon(onPressed:startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('START',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}