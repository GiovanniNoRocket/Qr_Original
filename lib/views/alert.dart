import 'package:flutter/material.dart';

enum AlertMessageType {
  Error,
  Warning,
  Notification,
  Success,
}

class AlertDialogView extends StatelessWidget {
  final String message;
  final AlertMessageType messageType;

  AlertDialogView({required this.message, required this.messageType});

  IconData _getIconData() {
    switch (messageType) {
      case AlertMessageType.Error:
        return Icons.error;
      case AlertMessageType.Warning:
        return Icons.warning;
      case AlertMessageType.Notification:
        return Icons.info;
      case AlertMessageType.Success:
        return Icons.check_circle;
      default:
        return Icons.info;
    }
  }

  String _getMessage() {
    switch (messageType) {
      case AlertMessageType.Error:
        return 'Error';
      case AlertMessageType.Warning:
        return 'Advertencia';
      case AlertMessageType.Notification:
        return 'Notificación';
      case AlertMessageType.Success:
        return 'Éxito';
      default:
        return 'Notificación';
    }
  }

  Color _getIconColor() {
    switch (messageType) {
      case AlertMessageType.Error:
        return Colors.red;
      case AlertMessageType.Warning:
        return Colors.orange;
      case AlertMessageType.Notification:
        return Colors.blue;
      case AlertMessageType.Success:
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(_getIconData(), color: _getIconColor()),
          SizedBox(width: 8),
          Text(_getMessage()),
        ],
      ),
      content: Text(message),
      actions: [
        TextButton(
          child: Text('Aceptar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
