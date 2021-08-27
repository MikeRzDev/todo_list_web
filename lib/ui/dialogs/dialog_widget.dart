import 'package:flutter/material.dart';

Future<T?> showInformationDialog<T>(
  BuildContext context, {
  required String title,
  required String message,
  String okButtonText = 'Ok',
  VoidCallback? onOkPressed,
}) =>
    showDialog<T>(
      barrierColor: Colors.white,
      barrierDismissible: true,
      context: context,
      builder: (_) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            SizedBox(height: 20),
            Text(message),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            )
          ],
        ),
      ),
    );
