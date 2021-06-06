import 'package:flutter/material.dart';

class NewTaskInformation extends StatefulWidget {
  final Function addTaskInformation;

  NewTaskInformation(this.addTaskInformation);

  @override
  _NewTaskInformationState createState() => _NewTaskInformationState();
}

class _NewTaskInformationState extends State<NewTaskInformation> {
  final idController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  DateTime bdayPicker = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: bdayPicker,
        firstDate: DateTime(1960),
        lastDate: DateTime(2022));
    if (picked != null)
      setState(() {
        bdayPicker = picked;
      });
  }

  void submitData() {
    final enteredId = idController.text;
    final enteredFName = fNameController.text;
    final enteredLName = lNameController.text;

    if (enteredFName.isEmpty || enteredLName.isEmpty || enteredId.isEmpty)
      return;

    widget.addTaskInformation(
      idController.text,
      fNameController.text,
      lNameController.text,
      bdayPicker,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Id'),
              controller: idController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
              controller: fNameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
              controller: lNameController,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Birthday'),
            ),
            TextButton(
              onPressed: submitData,
              child: Text('Hello'),
            ),
          ],
        ),
      ),
    );
  }
}
