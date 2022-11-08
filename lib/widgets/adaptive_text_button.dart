import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final VoidCallback handlerDatePicker;

  const AdaptiveTextButton(this.text, this.handlerDatePicker, {super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handlerDatePicker,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : TextButton(
            onPressed: handlerDatePicker,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
