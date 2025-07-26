import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_two.dart';
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
      //extendBodyBehindAppBar: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: AppColors.themeColor,
        title:   Text('Business Book',style: AppTextStyles.appbar()),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add,color: Colors.white70,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert,color: Colors.white70,)),
        ],
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundTwo()),
          Padding(
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
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                               Text(
                                'Net Balance',
                                style: AppTextStyles.bodyMedium(fontSize: 18,fontWeight: FontWeight.bold,),
                              ),
                              const SizedBox(height: 10),
                               Text(
                                '2000',
                                style: AppTextStyles.bodyMedium(fontWeight: FontWeight.bold,fontSize: 24),
                              ),
                              const SizedBox(height: 16),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total In (+)',style: AppTextStyles.bodyMediumPopins(color: AppColors.themeColor,fontSize: 14),),
                                  Text('3000',
                                      style: AppTextStyles.bodyMediumPopins(color: Colors.green)),
                                ],
                              ),
                              const SizedBox(height: 10),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Out (-)',style: AppTextStyles.bodyMediumPopins(color: AppColors.themeColor,fontSize: 14),),
                                  Text('1000', style: AppTextStyles.bodyMediumPopins(color: Colors.red)),
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
                       Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //SizedBox(width: 40),
                            const Icon(Icons.lock, color: Colors.green),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Only members of this book can see these entries',
                                style: AppTextStyles.titleSmall(fontSize: 14,color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                        ListView.builder(
                          itemCount: 5,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                          return Card(
                            elevation: 6,
                              child: _buildEntryHistory());
                        },
                        )
                        //_buildEntryHistory(),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              _showCashInCashOut(),
            ],
          ),
        ),
    ],
      ),
    );
  }

  ListTile _buildEntryHistory() {
    return  ListTile(
                          title: Text('Category: income',style: AppTextStyles.bodyMediumPopins(color: AppColors.themeColor),),
                          subtitle: Text('Date & Time:01-07-25',style: AppTextStyles.subtitleSmall(color: Colors.black87),),
                          trailing: Text('CashOut:200',style: AppTextStyles.subtitleSmall(color: Colors.black87,fontSize: 15),),
                        );
  }

  Container _showCashInCashOut() {
    return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Record Income',
                        style: AppTextStyles.bodyMediumWhite(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Record Expense',
                        style: AppTextStyles.bodyMediumWhite(fontSize: 16,fontWeight: FontWeight.w500),
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
