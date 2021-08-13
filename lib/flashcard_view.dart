import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;

  FlashcardView({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.yellow,
      elevation: 10,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
            style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}