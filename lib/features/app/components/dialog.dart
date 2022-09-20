import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> showInfoAlertDialog(
    BuildContext context, {
    required String content,
    required Function() okPressed,
    bool isCancel = true,
  }) async {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text(
                  'Warning!',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  content,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  if (isCancel)
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  CupertinoButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      okPressed();
                    },
                    child: const Text(
                      'Ok',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            : AlertDialog(
                title: const Text(
                  'Warning!',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  content,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  if (isCancel)
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      okPressed();
                    },
                    child: const Text(
                      'Ok',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
