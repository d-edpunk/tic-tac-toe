import 'package:flutter/material.dart';
import 'game.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Tic-Tac-Toe',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            backgroundColor: const Color.fromARGB(255, 68, 68, 68)),
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 68, 68))),
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text('PLAY',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Game()));
                  })
            ])));
  }
}
