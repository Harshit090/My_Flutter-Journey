import 'package:flutter/material.dart';

class Answer_Button extends StatelessWidget {
  final Function thingToDo;
  final String buttonText;

  Answer_Button(this.thingToDo, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: thingToDo,
      child: Text(buttonText),
    );
    //style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),),
    // the above mentioned style is used in elevated button ot style the backgroundcolor
    //by default the stling of the elevated button is set to blue
    //we can change it to what we may need by using the abovr code.
    //
    // if we want to add a tect color. we acn do so by using.
    // foregroundColor: MaterialStateProperty.all(Colors.white)
  }
}
