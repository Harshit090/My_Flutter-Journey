import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //the first player is O!
  List<String> display_x_o = ['', '', '', '', '', '', '', '', ''];
  int exScore = 0;
  int ohScore = 0;
  int filledBox = 0;
  bool winCondition = false;

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  //var myStyle = TextStyle(color: Colors.white, fontSize: 40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player X',
                          style: myNewFontWhite,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          exScore.toString(),
                          style: myNewFontWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player o',
                          style: myNewFontWhite,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          ohScore.toString(),
                          style: myNewFontWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.grey.shade900,
          )),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && display_x_o[index] == '') {
        display_x_o[index] = 'o';
        ohTurn = !ohTurn;
        filledBox += 1;
      } else if (!ohTurn && display_x_o[index] == '') {
        display_x_o[index] = 'x';
        ohTurn = !ohTurn;
        filledBox += 1;
      }
      _checkWinner();
    });
  }

  void _checkWinner() {
    //Check 1st row
    if (display_x_o[0] == display_x_o[1] &&
        display_x_o[0] == display_x_o[2] &&
        display_x_o[0] != '') {
      _showWinDialog(display_x_o[0]);
      winCondition = true;
      return;
    }

    //Check 2nd row
    if (display_x_o[3] == display_x_o[4] &&
        display_x_o[3] == display_x_o[5] &&
        display_x_o[3] != '') {
      _showWinDialog(display_x_o[3]);
      winCondition = true;
      return;
    }
    //Check 3rd row
    if (display_x_o[6] == display_x_o[7] &&
        display_x_o[6] == display_x_o[8] &&
        display_x_o[6] != '') {
      _showWinDialog(display_x_o[6]);
      winCondition = true;
      return;
    }
    //Check 1st column
    if (display_x_o[0] == display_x_o[3] &&
        display_x_o[0] == display_x_o[6] &&
        display_x_o[0] != '') {
      _showWinDialog(display_x_o[0]);
      winCondition = true;
      return;
    }
    //Check 2nd column
    if (display_x_o[1] == display_x_o[4] &&
        display_x_o[1] == display_x_o[7] &&
        display_x_o[1] != '') {
      _showWinDialog(display_x_o[1]);
      winCondition = true;
      return;
    }
    //Check 3rd column
    if (display_x_o[2] == display_x_o[5] &&
        display_x_o[2] == display_x_o[8] &&
        display_x_o[2] != '') {
      _showWinDialog(display_x_o[2]);
      winCondition = true;
      return;
    }
    //Check 1st diagnal
    if (display_x_o[0] == display_x_o[4] &&
        display_x_o[0] == display_x_o[8] &&
        display_x_o[0] != '') {
      _showWinDialog(display_x_o[0]);
      winCondition = true;
      return;
    }

    //Check 2nd diagnal
    if (display_x_o[2] == display_x_o[4] &&
        display_x_o[2] == display_x_o[6] &&
        display_x_o[2] != '') {
      _showWinDialog(display_x_o[2]);
      winCondition = true;
      return;
    } else if (filledBox == 9 && winCondition == false) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Winner is : $winner',
              style: myNewFont,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Play Again.',
                    style: myNewFont,
                  ))
            ],
          );
        });

    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Draw',
              style: myNewFont,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Play Again.',
                    style: myNewFont,
                  ))
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        display_x_o[i] = '';
      }
    });
    filledBox = 0;
    winCondition = false;
  }
}
