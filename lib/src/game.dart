import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cell.dart';
import 'cell_state.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  CellState current = CellState()..state = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CellState>(
      create: (context) => current,
      child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) => Cell(index))
      ))
    );
  }
}
