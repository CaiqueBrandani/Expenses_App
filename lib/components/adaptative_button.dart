import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;

  const AdaptativeButton({
    super.key,
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return UniversalPlatform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label!.toString()),
          )
        : TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: Text(label!.toString()),
          );
  }
}
