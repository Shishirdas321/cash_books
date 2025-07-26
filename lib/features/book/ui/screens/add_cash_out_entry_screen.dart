import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddCashOutEntryScreen extends StatefulWidget {
  const AddCashOutEntryScreen({super.key});

  static const String name = '/add-cash-out';

  @override
  State<AddCashOutEntryScreen> createState() => _AddCashOutEntryScreenState();
}

class _AddCashOutEntryScreenState extends State<AddCashOutEntryScreen> {
 static DateTime selectedDate = DateTime.now();
 static TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categorysController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
     // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
         leading: const BackButton(color: Colors.white,),
        title:  Text(
          'Add Cash Out Entry',
          style: AppTextStyles.appbar(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,color: Colors.white70,),
            onPressed: () {
              // settings action
            },
          )
        ],
      ),
      body: Stack(
        children:[
          const Positioned.fill(child: ScreenBackgroundOne()),
          Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 20,top: 30),
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
                controller: _categorysController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.category_outlined,),
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
                const Icon(Icons.calendar_today,color: Colors.white),
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
        const SizedBox(width: 16),
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
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _categorysController.dispose();
  }
}
/*
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/book/ui/screens/controllers/cash_out_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 // Update this import path accordingly

class AddCashOutEntryScreen extends StatefulWidget {
  const AddCashOutEntryScreen({super.key});

  static const String name = '/add-cash-out';

  @override
  State<AddCashOutEntryScreen> createState() => _AddCashOutEntryScreenState();
}

class _AddCashOutEntryScreenState extends State<AddCashOutEntryScreen> {
  final CashOutController controller = Get.find<CashOutController>();

  late TextEditingController _amountController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: controller.amount.value);
    _categoryController = TextEditingController(text: controller.category.value);

    _amountController.addListener(() {
      controller.setAmount(_amountController.text);
    });

    _categoryController.addListener(() {
      controller.setCategory(_categoryController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Add Cash Out Entry',
          style: AppTextStyles.appbar(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white70),
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
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDateAndTime(context),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    hintText: 'Amount',
                    border: OutlineInputBorder(),
                    suffixText: 'Taka',
                    suffixStyle: TextStyle(color: AppColors.themeColor),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save logic
                      print('Date: ${controller.selectedDate.value}');
                      print('Time: ${controller.selectedTime.value.format(context)}');
                      print('Amount: ${controller.amount.value}');
                      print('Category: ${controller.category.value}');
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
            onTap: () => _selectDate(context),
            child: Obx(() {
              final d = controller.selectedDate.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    "${d.day}/${d.month}/${d.year}",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              );
            }),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () => _selectTime(context),
            child: Obx(() {
              final t = controller.selectedTime.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    t.format(context),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.setDate(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: controller.selectedTime.value,
    );
    if (picked != null) {
      controller.setTime(picked);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}

*/
