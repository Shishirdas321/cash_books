import 'package:cash_books/features/businessteam/widgets/select_book_card.dart';
import 'package:flutter/material.dart';

class MemberAddToSelectBook extends StatefulWidget {
  const MemberAddToSelectBook({super.key});

  static const String name = '/member-add-to-select-book';

  @override
  State<MemberAddToSelectBook> createState() => _MemberAddToSelectBookState();
}

class _MemberAddToSelectBookState extends State<MemberAddToSelectBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to book'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const SelectBookCard();
                      },
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('Add TO BOOK'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
