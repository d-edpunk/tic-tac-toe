import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cell_state.dart';

class Cell extends StatefulWidget {
  int index;

  Cell(this.index, {super.key});

  @override
  State<Cell> createState() => _CellState(index);
}

class _CellState extends State<Cell> {
  CellState state = CellState();
  int index;

  _CellState(this.index);

  @override
  Widget build(BuildContext context) {
    var newState = context.watch<CellState>().state;
    return Container(margin: const EdgeInsets.all(10), child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
        shadowColor: const Color.fromARGB(0, 0, 0, 0)
      ),
      onPressed: () {
        setState(() {
          state.state = newState;
          _cells[index] = newState;
          onCellsUpdate(context);
        });
        context.read<CellState>().changeState();
      },
      child: getCellIcon()
    ));
  }

  Widget getCellIcon() {
    switch (state.state) {
      case true:
        return const Icon(Icons.close, color: Colors.red);
      case false:
        return const Icon(Icons.adjust, color: Colors.blue);
      default: // empty
        return const Icon(Icons.sms, color: Color.fromARGB(0, 0, 0, 0));
    }
  }
}

List<bool?> _cells = List.generate(9, (index) => null);
void onCellsUpdate(BuildContext context) {
  // horizontal lines
  for (var i = 0; i < _cells.length - 2; i++) {
    if (_cells[i] == null) {
      continue;
    }
    if ((_cells[i] == _cells[i + 1]) && (_cells[i + 1] == _cells[i + 2])) {
      print('horizontal win');
    }
  }

  for (var i = 0; i < 3; i++) {
    if (_cells[i] == null) {
      continue;
    }
    if ((_cells[i] == _cells[i + 3]) && (_cells[i + 3] == _cells[i + 6])) {
      print('vertical win');
    }
  }

  if (_cells[4] != null) {
    if (((_cells[0] == _cells[4]) && (_cells[4] == _cells[8])) || ((_cells[2] == _cells[4]) && (_cells[4] == _cells[6]))) {
      print('diagonal win');
    }
  }

  for (var el in _cells) {
    if (el == null) {
      return;
    }
  }
  print('lose: no free cells');
}
