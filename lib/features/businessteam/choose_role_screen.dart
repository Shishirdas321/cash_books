import 'package:cash_books/features/businessteam/business_team_handel_veiw_screen.dart';
import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  static const String name = '/choose-role';

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = 'Staff';

  @override
  Widget build(BuildContext context) {
    final bool isStaff = selectedRole == 'Staff';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Role'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                " Choose their role in this business and add",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.mark_email_read_outlined),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "dknnn22@gmail.com",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "dknnn22@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                child: Column(
                  children: [
                    const Text(
                      "Choose Role & Invite",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ChoiceChip(
                                label: const Text("Partner"),
                                selected: selectedRole == 'Partner',
                                onSelected: (_) {
                                  setState(() {
                                    selectedRole = 'Partner';
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ChoiceChip(
                                label: const Text("Staff"),
                                selected: selectedRole == 'Staff',
                                onSelected: (_) {
                                  setState(() {
                                    selectedRole = 'Staff';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Permissions",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ..._buildPermissions(isStaff),
                    const SizedBox(height: 16),
                    const Text(
                      "Restrictions",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ..._buildRestrictions(isStaff),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 6,left: 8),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey),
                    Text(
                      'You can change this role letter',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  // Handle add action here
                  Navigator.pushNamed(
                      context, BusinessTeamHandelViewScreen.name);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Team member added done'),
                    ),
                  );
                },
                child: Text("+ ADD AS ${selectedRole.toUpperCase()}"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPermissions(bool isStaff) {
    if (isStaff) {
      return const [
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text("Limited access to selected books"),
        ),
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text(
            "Owner/Partner can assign Admin, Viewer or Data Operator role to staff in any book",
          ),
        ),
      ];
    } else {
      return const [
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text("Full access to all books of this business"),
        ),
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text("Full access to business settings"),
        ),
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text("Add/remove members in business"),
        ),
      ];
    }
  }

  List<Widget> _buildRestrictions(bool isStaff) {
    if (isStaff) {
      return const [
        ListTile(
          leading: Icon(Icons.cancel, color: Colors.red),
          title: Text("No access to books they are not part of"),
        ),
        ListTile(
          leading: Icon(Icons.cancel, color: Colors.red),
          title: Text("No access to business settings"),
        ),
        ListTile(
          leading: Icon(Icons.cancel, color: Colors.red),
          title: Text("No option to delete books"),
        ),
      ];
    } else {
      return const [
        ListTile(
          leading: Icon(Icons.cancel, color: Colors.red),
          title: Text("Can’t delete business"),
        ),
        ListTile(
          leading: Icon(Icons.cancel, color: Colors.red),
          title: Text("Can’t remove owner from business"),
        ),
      ];
    }
  }
}
