import 'package:flutter/material.dart';

class ConfirmationDialogHelper {
  // ConfirmationDialogHelper.showConfirmationDialog(...)
  static void showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback confirmationCallback,
    String labelYesButton = 'Confirmar',
    String labelNoButton = 'Cancelar',
  }) {
    final confirmationDialog = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                confirmationCallback();
              },
              child: Text(labelYesButton),
            )),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).unselectedWidgetColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(labelNoButton),
              ),
            )
          ],
        )
      ],
    );

    showDialog(context: context, builder: (context) => confirmationDialog);
  }
}
