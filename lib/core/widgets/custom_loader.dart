import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  final double size;

  const CustomLoader({super.key, this.color, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActivityIndicator(
          color: color ?? Theme.of(context).primaryColor,
        )
        : CircularProgressIndicator(
          color: color ?? Theme.of(context).primaryColor,
        );
  }
}
