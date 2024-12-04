import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  String get title => _titleController.text;
  Category selectedCategory = Category.leisure;
  DateTime? selectedDate;
  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate!, //  TODO :  For now it s a fake data
        category: selectedCategory); //  TODO :  For now it s a fake data

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  Future<void> setDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              Text(
                selectedDate == null
                    ? "No date selected"
                    : "${selectedDate!.toLocal()}".split(" ")[0],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(onPressed: setDate, icon: Icon(Icons.calendar_month))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: selectedCategory,
                items: const [
                  DropdownMenuItem(child: Text('FOOD'), value: Category.food),
                  DropdownMenuItem(
                      child: Text('TRAVEL'), value: Category.travel),
                  DropdownMenuItem(
                      child: Text('LEISURE'), value: Category.leisure),
                  DropdownMenuItem(child: Text('WORK'), value: Category.work),
                ],
                onChanged: (Category? value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              Spacer(),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onCancel,
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onAdd,
                  child: const Text('Create'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[100]),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
