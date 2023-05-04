import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction({required this.addNewTx});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameInputControler = TextEditingController();
  final amountInputControler = TextEditingController();
  DateTime? selectedDate = null;

  //String? nameInput;

  // ignore: non_constant_identifier_names
  void SubmitData() {
    if (amountInputControler.text.isEmpty) {
      return;
    }
    final enteredTitle = nameInputControler.text;
    final enteredAmount = double.parse(amountInputControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addNewTx(
      enteredTitle,
      enteredAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(
        () {
          selectedDate = pickedDate;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              controller: nameInputControler,
              onSubmitted: (_) => SubmitData(),
              //onChanged: (val) => nameInput = val,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Price'),
              controller: amountInputControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => SubmitData(),
              //onChanged: (val) => amountInput = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? 'No Date Chossen!'
                      : 'Picked Date: ${DateFormat.yMd().format(selectedDate!)}',
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: _presentDatePicker,
                  child: const Text(
                    'Choose date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: SubmitData,
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).primaryColorLight,
              ),
              child: const Text(
                'data',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
