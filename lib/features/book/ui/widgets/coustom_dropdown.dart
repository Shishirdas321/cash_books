
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupSearchableDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final Map<String, List<String>>? subItems; // Added this line
  final ValueChanged<String?> onChanged;
  final String? value;
  final Widget? actionIcon;
  final String hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? fieldColor;
  final TextEditingController? controller;

  const PopupSearchableDropdownField({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.subItems, // Added this line
    this.actionIcon,
    this.hintText = "Search or Select",
    this.textStyle,
    this.hintStyle,
    this.fieldColor, this.controller,
  }) : super(key: key);

  @override
  State<PopupSearchableDropdownField> createState() =>
      _PopupSearchableDropdownFieldState();
}

class _PopupSearchableDropdownFieldState
    extends State<PopupSearchableDropdownField>
    with SingleTickerProviderStateMixin {
  String? selectedValue;
  OverlayEntry? _overlayEntry;
  final TextEditingController _searchController = TextEditingController();
  List<String> filteredItems = [];

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    filteredItems = List.from(widget.items);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 0.9, end: 1.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOutBack,
        ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  void _openDropdown() {
    if (_overlayEntry != null) return;

    // Reset filtered items when opening dropdown
    filteredItems = List.from(widget.items);
    _searchController.clear();

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
            _closeDropdown();
          },
          child: Material(
            color: Colors.black.withOpacity(0.3),
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 8)
                      ],
                    ),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.6,
                      maxWidth: 400,
                    ),
                    child: StatefulBuilder(
                      builder: (context, setStateModal) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextField(
                                controller: _searchController,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: _searchController.text.isNotEmpty
                                      ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      _searchController.clear();
                                      setStateModal(() {
                                        filteredItems =
                                            List.from(widget.items);
                                      });
                                    },
                                  )
                                      : null,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onChanged: (value) {
                                  setStateModal(() {
                                    if (value.isEmpty) {
                                      filteredItems = List.from(widget.items);
                                    } else {
                                      filteredItems = widget.items
                                          .where((item) {
                                        bool itemMatch = item
                                            .toLowerCase()
                                            .contains(value.toLowerCase());

                                        // Also search in sub-items if they exist
                                        bool subItemMatch = false;
                                        if (widget.subItems?[item] != null) {
                                          subItemMatch = widget.subItems![item]!
                                              .any((subItem) => subItem
                                              .toLowerCase()
                                              .contains(value.toLowerCase()));
                                        }

                                        return itemMatch || subItemMatch;
                                      }).toList();
                                    }
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 250.h,
                                ),
                                child: filteredItems.isEmpty
                                    ? const Center(
                                  child: Text(
                                    "No data found",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                )
                                    : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: filteredItems.length,
                                  itemBuilder: (context, index) {
                                    String item = filteredItems[index];
                                    bool hasSubItems = widget.subItems?[item] != null;
                                    String displayText = item;

                                    // Add sub-items in brackets if they exist
                                    if (hasSubItems) {
                                      String subItemsText = widget.subItems![item]!.join(', ');
                                      displayText = '$item ($subItemsText)';
                                    }

                                    return ListTile(
                                      title: Text(displayText),
                                      selected: item == selectedValue,
                                      selectedTileColor: Colors.grey.shade200,
                                      onTap: () {
                                        setState(() {
                                          selectedValue = item; // Only select main item
                                        });
                                        widget.onChanged(selectedValue);
                                        _closeDropdown();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  int _getTotalItemCount() {
    // Only count main items since sub-items are now shown inline
    return filteredItems.length;
  }

  /*Widget _buildListItem(int globalIndex) {
    int currentIndex = 0;

    for (var item in filteredItems) {
      // Check if this is the main item
      if (currentIndex == globalIndex) {
        return _buildMainItem(item);
      }
      currentIndex++;

      // Check sub-items
      if (widget.subItems?[item] != null) {
        for (int subIndex = 0; subIndex < widget.subItems![item]!.length; subIndex++) {
          if (currentIndex == globalIndex) {
            return _buildSubItem(item, subIndex);
          }
          currentIndex++;
        }
      }
    }

    return const SizedBox.shrink();
  }*/

 /* Widget _buildMainItem(String item) {
    bool isSelected = item == selectedValue;
    bool hasSubItems = widget.subItems?[item] != null;

    return ListTile(
      leading: hasSubItems
          ? const Icon(Icons.folder, color: Colors.blue, size: 20)
          : const Icon(Icons.description, color: Colors.grey, size: 20),
      title: Text(
        item,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.blue : Colors.black87,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.grey.shade200,
      onTap: () {
        setState(() {
          selectedValue = item;
        });
        widget.onChanged(selectedValue);
        _closeDropdown();
      },
    );
  }*/

/*  Widget _buildSubItem(String parentItem, int subIndex) {
    String subItem = widget.subItems![parentItem]![subIndex];
    bool isSelected = subItem == selectedValue;

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        leading: const Icon(Icons.subdirectory_arrow_right,
            color: Colors.grey, size: 18),
        title: Text(
          subItem,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.black54,
            fontSize: 14,
          ),
        ),
        selected: isSelected,
        selectedTileColor: Colors.grey.shade200,
        onTap: () {
          setState(() {
            selectedValue = subItem;
          });
          widget.onChanged(selectedValue);
          _closeDropdown();
        },
      ),
    );
  }*/

  void _closeDropdown() {
    if (_overlayEntry != null) {
      _animationController.reverse().then((_) {
        // Remove overlay safely without accessing context in dispose
        if (mounted) {
          _overlayEntry?.remove();
        }
        _overlayEntry = null;
      });
    }
    _searchController.clear();
    setState(() {
      filteredItems = List.from(widget.items);
    });
  }

  @override
  void dispose() {
    // Safe overlay removal without calling context-dependent methods
    if (_overlayEntry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      });
    }

    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_overlayEntry != null) {
          _closeDropdown();
          return false;
        }
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style:AppTextStyles.subtitleSmall(color: Colors.grey)
              ),
              SizedBox(height: 6,),
              if (widget.actionIcon != null) ...[
                const SizedBox(width: 8),
                widget.actionIcon!,
              ],
            ],
          ),
          GestureDetector(
            onTap: () {
              if (_overlayEntry == null) {
                _openDropdown();
              } else {
                _closeDropdown();
              }
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: widget.fieldColor ?? Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedValue ?? widget.hintText,
                      style: selectedValue == null
                          ? widget.hintStyle ?? const TextStyle(color: Colors.grey)
                          : widget.textStyle ?? const TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 1,
                    color: Colors.grey.shade400,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

