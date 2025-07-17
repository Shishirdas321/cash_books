import 'package:flutter/material.dart';

class AddCashOutEntryScreen extends StatefulWidget {
  const AddCashOutEntryScreen({super.key});

  static const String name = '/add-cash-out';

  @override
  State<AddCashOutEntryScreen> createState() => _AddCashOutEntryScreenState();
}

class _AddCashOutEntryScreenState extends State<AddCashOutEntryScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(),
        title: const Text('Add Cash Out Entry'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // settings action
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date and Time Row
            _buildDateAndTime(context),
            const SizedBox(height: 20),
            // Amount Field
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
                suffixText: 'Taka',
              ),
            ),
            const Spacer(),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save logic
                },
                child: const Text('SAVE'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildDateAndTime(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: _selectDate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 10),
                Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: _selectTime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 10),
                Text(
                  selectedTime.format(context),
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}
