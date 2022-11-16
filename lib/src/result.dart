import 'package:flutter/material.dart';
import 'game.dart';
import 'cell.dart' show newGame;

class ResultScreen extends StatelessWidget {
  final bool? result;

  const ResultScreen(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    late Widget resultText;
    switch (result) {
      case true:
        resultText = const Text('RED',
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold));
        break;
      case false:
        resultText = const Text('BLUE',
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold));
        break;
      default:
        resultText = const Text('DRAW',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold));
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        body: Center(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              resultText,
              Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 68, 68, 68))),
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          child: const Text('PLAY AGAIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white))),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Game()));
                        newGame();
                      }))
            ])));
  }
}
