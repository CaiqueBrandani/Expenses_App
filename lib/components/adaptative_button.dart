// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;

  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return UniversalPlatform.isIOS 
        ? CupertinoButton(
            child: Text(label!.toString()),
            onPressed: onPressed,
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : RaisedButton(
            child: Text(label!.toString()),
            color: Theme.of(context).colorScheme.secondary,
            textColor: Colors.white,
            onPressed: onPressed,
          );
  }
}
