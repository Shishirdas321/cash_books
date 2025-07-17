import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';
import 'package:cash_books/features/businessteam/business_team_screen.dart';
import 'package:cash_books/features/home/ui/widgets/book_card.dart';
import 'package:cash_books/features/home/ui/widgets/business_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController(); // [1] ScrollController added
  bool _isScrollingDown = false; // [2] Track scroll direction

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          setState(() {
            _isScrollingDown = true;
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (_isScrollingDown) {
          setState(() {
            _isScrollingDown = false;
          });
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            const Icon(Icons.business_outlined),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showBusinessSelector(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Man',
                      style: textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Tap to switch business',
                      style:
                      textTheme.bodySmall?.copyWith(color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, BusinessTeamScreen.name);
              },
              icon: const Icon(Icons.person_add_alt),
            ),
          ],
        ),
      ),
      body: ListView(
        controller: _scrollController, // [3] Attach controller here
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Books',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.themeColor,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const BookCard();
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
      floatingActionButton: AnimatedSwitcher( // [4] Animated FAB
        duration: const Duration(milliseconds: 50),
        child: _isScrollingDown
            ? FloatingActionButton(
          key: const ValueKey('iconOnly'),
          onPressed: () {
            _showCustomBottomSheet(context);
          },

          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        )
            : FloatingActionButton.extended(
          key: const ValueKey('iconWithText'),
          onPressed: () {
            _showCustomBottomSheet(context);
          },
          label: const Text('Add New Book'),
          icon: const Icon(Icons.add),
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 300,
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.themeColor,
                        ),
                      ),
                      const Text(
                        'Add New Book',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration:
                    const InputDecoration(labelText: 'Enter Book name'),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add NEW BOOK'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBusinessSelector(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.themeColor,
                      ),
                    ),
                    const Text(
                      'Select Business',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const BusinessListTile(
                          isSelected: true,
                        );
                      }),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddNewBusinessScreen.name);
                  },
                  child: const Text('Add New Business'),
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
