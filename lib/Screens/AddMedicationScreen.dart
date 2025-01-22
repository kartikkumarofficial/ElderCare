import 'package:flutter/material.dart';

class AddMedicationScreen extends StatefulWidget {
  final Function(String, String, String) onAdd;

  AddMedicationScreen({required this.onAdd});

  @override
  _AddMedicationScreenState createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Medication")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Medication Name"),
            ),
            TextField(
              controller: doseController,
              decoration: InputDecoration(labelText: "Dose"),
            ),
            TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: "Time"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                widget.onAdd(
                  nameController.text,
                  doseController.text,
                  timeController.text,
                );
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
