import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddCashInEntryScreen extends StatefulWidget {
  const AddCashInEntryScreen({super.key});

  static const String name = '/add-cash-in';

  @override
  State<AddCashInEntryScreen> createState() => _AddCashInEntryScreenState();
}

class _AddCashInEntryScreenState extends State<AddCashInEntryScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
     // extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: AppColors.themeColor,
        // leading: BackButton(),
        title:  Text(
          'Add Cash In Entry',
          style: AppTextStyles.appbar(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,color: Colors.white,),
            onPressed: () {
              // settings action
            },
          )
        ],
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundOne()),
          Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 20,left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date and Time Row
              _buildDateAndTime(context),
              const SizedBox(height: 20),
              // Amount Field
              TextFormField(
                controller: _amountController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.money),
                  hintText: 'Amount',
                  border: OutlineInputBorder(),
                  suffixText: 'Taka',suffixStyle: TextStyle(color: AppColors.themeColor),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _categoryController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.category_outlined),
                  hintText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Save logic
                  },
                  child: const Text('SAVE'),
                ),
              )
            ],
          ),
        ),
    ],
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
                const Icon(Icons.calendar_today,color: Colors.white,),
                const SizedBox(width: 10),
                Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  style: const TextStyle(fontSize: 16,color: Colors.white),
                ),
                const Icon(Icons.arrow_drop_down,color: Colors.white,),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: InkWell(
            onTap: _selectTime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.access_time,color: Colors.white,),
                const SizedBox(width: 10),
                Text(
                  selectedTime.format(context),
                  style: const TextStyle(fontSize: 16,color: Colors.white),
                ),
                const Icon(Icons.arrow_drop_down,color: Colors.white,),
              ],
            ),
          ),
        ),
      ],
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountController.dispose();
  }
}
