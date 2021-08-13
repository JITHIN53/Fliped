import './flashcard.dart';
import './flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language does Flutter use?",
        answer: "Dart"),
    Flashcard(question: "Who you gonna call?", answer: "MEEeeeeeee!"),
    Flashcard(question: "who are uuu?", answer: "only me!")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(
            child: Text(
              'FLIP Me',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        body: Center(
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                      width: 250,
                      height: 400,
                      child: FlipCard(
                          front: FlashcardView(
                            text: _flashcards[_currentIndex].question,
                          ),
                          back: FlashcardView(
                            text: _flashcards[_currentIndex].answer,
                          ))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlineButton.icon(
                      splashColor: Colors.yellow,
                      onPressed: showPreviousCard,
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.brown,
                      ),
                      label: Text('Prev'),
                      textColor: Colors.brown,
                    ),
                    OutlineButton.icon(
                      splashColor: Colors.yellow,
                      onPressed: showNextCard,
                      icon: Icon(Icons.chevron_right, color: Colors.brown),
                      label: Text('Next'),
                      textColor: Colors.brown,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
