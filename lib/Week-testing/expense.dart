import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExpenseFormScreen(),
    );
  }
}

class ExpenseFormScreen extends StatelessWidget {
  const ExpenseFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Form'),
      ),
      body: const ExpenseForm(),
    );
  }
}

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  TextEditingController _titleController = TextEditingController();

  void onPressed() {
    String title = _titleController.text;
    print("Title= $title");
  }

  @override
  void dispose() {
    // Dispose the controller
    _titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text("PRINT VALUES"),
          ),
        ],
      ),
    );
  }
}
