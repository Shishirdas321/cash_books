import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  final double size;

  const CustomLoader({super.key, this.color, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    final isCupertino = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

    return SizedBox(
      height: size,
      width: size,
      child: isCupertino
          ? CupertinoActivityIndicator(
        color: color ?? Theme.of(context).primaryColor,
      )
          : CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

