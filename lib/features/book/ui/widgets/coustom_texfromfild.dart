import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String text = newValue.text.replaceAll(',', ''); // remove old commas

    if (text.isEmpty) return newValue;

    // split decimal if exists
    List<String> parts = text.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? '.' + parts[1] : '';

    // format integer part with comma
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    String formatted = integerPart.replaceAllMapped(reg, (Match m) => ',');

    formatted += decimalPart;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
