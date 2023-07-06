import 'package:flutter/material.dart';
import 'package:qr_original/views/alert.dart';

void showPersonalizateAlert(
    BuildContext context, String Message, AlertMessageType alertMessageType) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogView(message: Message, messageType: alertMessageType);
    },
  );
}
