import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addTx(enteredTitle, enteredAmount);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), //when forced to use and arg thats not needed we
              //use (_)
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  // const Text(
                  //   "No Date Chosen!",
                  // ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Chose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              // style: const ButtonStyle(
              //     backgroundColor:
              //         MaterialStatePropertyAll<Color>(Colors.green),
              //     foregroundColor:
              //         MaterialStatePropertyAll<Color>(Colors.white)),
              child: const Text(
                "Add Transaction",
                style: TextStyle(fontFamily: 'Open Sans'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
