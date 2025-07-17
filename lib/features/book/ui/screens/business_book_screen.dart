import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/book/ui/screens/add_cash_in_entry_screen.dart';
import 'package:cash_books/features/book/ui/screens/add_cash_out_entry_screen.dart';
import 'package:flutter/material.dart';

class BusinessBookScreen extends StatefulWidget {
  const BusinessBookScreen({super.key});

  static const String name = '/business-book';

  @override
  State<BusinessBookScreen> createState() => _BusinessBookScreenState();
}

class _BusinessBookScreenState extends State<BusinessBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Book',),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Net Balance Card
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Net Balance',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total In (+)'),
                                Text('0',
                                    style: TextStyle(color: Colors.green)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Out (-)'),
                                Text('0', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('VIEW REPORTS'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 40),
                          Icon(Icons.lock, color: Colors.green),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Only members of this book can see these entries',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            _showCashInCashOut(),
          ],
        ),
      ),
    );
  }

  Container _showCashInCashOut() {
    return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Record Income',
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        'Record Expense',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AddCashInEntryScreen.name);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text('CASH IN'),
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AddCashOutEntryScreen.name);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text('CASH OUT'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
