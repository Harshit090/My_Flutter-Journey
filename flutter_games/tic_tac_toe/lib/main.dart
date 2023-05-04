import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //the first player is O!
  List<String> display_x_o = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _tapped(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
              ),
              child: Center(
                child: Text(
                  display_x_o[index],
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn) {
        display_x_o[index] = 'o';
      } else {
        display_x_o[index] = 'x';
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //Check 1st row
    if (display_x_o[0] == display_x_o[1] &&
        display_x_o[0] == display_x_o[2] &&
        display_x_o[0] != '') {
      _showWinDialog(display_x_o[0]);
    }

    //Check 2nd row
    if (display_x_o[3] == display_x_o[4] &&
        display_x_o[3] == display_x_o[5] &&
        display_x_o[3] != '') {
      _showWinDialog(display_x_o[3]);
    }
    //Check 3rd row
    if (display_x_o[6] == display_x_o[7] &&
        display_x_o[6] == display_x_o[8] &&
        display_x_o[6] != '') {
      _showWinDialog(display_x_o[6]);
    }
    //Check 1st column
    if (display_x_o[0] == display_x_o[3] &&
        display_x_o[0] == display_x_o[6] &&
        display_x_o[0] != '') {
      _showWinDialog(display_x_o[0]);
    }
    //Check 2nd column
    if (display_x_o[1] == display_x_o[4] &&
        display_x_o[1] == display_x_o[7] &&
        display_x_o[1] != '') {
      _showWinDialog(display_x_o[1]);
    }
    //Check 3rd column
    if (display_x_o[2] == display_x_o[5] &&
        display_x_o[2] == display_x_o[8] &&
        display_x_o[2] != '') {
      _showWinDialog(display_x_o[2]);
    }
    //Check 1st diagnal
    if (display_x_o[0] == display_x_o[4] &&
        display_x_o[0] == display_x_o[8] &&
        display_x_o[0] != '') {
      _showWinDialog(display_x_o[0]);
    }

    //Check 2nd diagnal
    if (display_x_o[2] == display_x_o[4] &&
        display_x_o[2] == display_x_o[6] &&
        display_x_o[2] != '') {
      _showWinDialog(display_x_o[2]);
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is : ${winner}'),
          );
        });
  }
}
