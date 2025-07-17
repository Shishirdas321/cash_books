import 'package:cash_books/features/businessteam/member_add_to_select_book.dart';
import 'package:flutter/material.dart';

class MemberAddToBookView extends StatelessWidget {
  const MemberAddToBookView({super.key});

  static const String name = '/add-to-book-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Staff to book'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 8, right: 8, top: 8),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Column(
                children: [
                  Text(
                    'Roles of staff members in books',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Give them limited access to books of your choice',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                   ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person_outline,color: Colors.white,),
                    ),
                    title: Text('Admin'),
                    subtitle: Text(
                      "Full access to entries & book settings",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person_outline,color: Colors.white,),
                    ),
                    title: Text('Data Operator'),
                    subtitle: Text(
                      "Only add entry access",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person_outline,color: Colors.white,),
                    ),
                    title: Text('Viewer'),
                    subtitle: Text(
                      "Only view entry & reports access",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Next step:",style: TextStyle(color: Colors.grey),),
                  Text('Select books',style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MemberAddToSelectBook.name);
                },
                child: const Text("NEXT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
