import 'package:flutter/material.dart';

Future<T?> showInformationDialog<T>(
  BuildContext context, {
  required String title,
  required String message,
  bool isTwoButton = false,
  String okButtonText = 'Ok',
  VoidCallback? onOkPressed,
}) =>
    showDialog<T>(
      barrierDismissible: true,
      context: context,
      builder: (_) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(height: 20),
            Text(message),
          ],
        ),
        actions: [
          if (isTwoButton)
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(context),
            ),
          TextButton(
            child: Text(okButtonText),
            onPressed: () {
              Navigator.pop(context);
              onOkPressed?.call();
            },
          ),
        ],
      ),
    );
