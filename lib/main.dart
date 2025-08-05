import 'package:cash_books/app/app.dart';
import 'package:cash_books/datasource/local/session.dart';
import 'package:flutter/material.dart';

import 'get_di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();


  runApp(const CashBook());
}
