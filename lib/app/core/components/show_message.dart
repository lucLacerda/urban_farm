import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error, alert, info }

class GlobalStrings {
  String get globalFailure => 'Falha';

  String get globalAnUnexpectedErrorOccurredPleaseTryAgainLater => 'Ocorreu um erro inesperado, por favor tente novamente mais tarde.';

  String get globalSuccess => 'Sucesso!';
}

GlobalStrings globalMessage() => GlobalStrings();

void showError({
  final String title = '',
  final String? message,
  final int? duration,
}) =>
    _showCustomSnackbar(
      title: title.isEmpty ? globalMessage().globalFailure : title,
      message: message ?? globalMessage().globalAnUnexpectedErrorOccurredPleaseTryAgainLater,
      icon: Icons.cancel_outlined,
      type: SnackbarType.error,
      duration: duration,
    );

void showAlert({
  final String? title,
  final String? message,
  final int? duration,
}) =>
    _showCustomSnackbar(
      title: title,
      message: message ?? globalMessage().globalAnUnexpectedErrorOccurredPleaseTryAgainLater,
      icon: title != null ? Icons.warning_amber_outlined : null,
      type: SnackbarType.alert,
      duration: duration,
    );

void showSuccess({
  final String? title,
  final String? message,
  final int? duration,
}) =>
    _showCustomSnackbar(
      title: title ?? globalMessage().globalSuccess,
      message: message,
      icon: Icons.check_circle_outline,
      type: SnackbarType.success,
      duration: duration,
    );

void showInfo({
  final String? title,
  final String? message,
  final Color? backgroundColor,
  final int? duration,
}) =>
    _showCustomSnackbar(
      title: title,
      message: message,
      type: SnackbarType.info,
      position: SnackPosition.BOTTOM,
      duration: duration,
    );

void _showCustomSnackbar({
  final String? title,
  final String? message,
  final IconData? icon,
  final SnackbarType type = SnackbarType.success,
  final int? duration,
  final SnackPosition position = SnackPosition.TOP,
}) {
  if (Get.isSnackbarOpen) {
    return;
  }

  Get.showSnackbar(
    GetSnackBar(
      titleText: title != null
          ? Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: _getStyle(type).$1,
              size: 16,
            ),
            const SizedBox(width: 8),
          ],
          Text(title, style: TextStyle(color: _getStyle(type).$1)),
        ],
      )
          : null,
      messageText: message == null
          ? const SizedBox.shrink()
          : Text(
        message,
        textAlign: TextAlign.start,
        style: TextStyle(color: _getStyle(type).$1),
      ),
      duration: Duration(seconds: duration ?? 5),
      backgroundColor: Colors.black87,
      borderColor: _getStyle(type).$2,
      borderRadius: 4.0,
      margin: const EdgeInsets.all(8.0),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: position,
    ),
  );
}

(Color text, Color border) _getStyle(final SnackbarType type) {
  switch (type) {
    case SnackbarType.success:
      return (Colors.white, Colors.green);
    case SnackbarType.error:
      return (Colors.white, Colors.redAccent);
    case SnackbarType.alert:
      return (Colors.white, Colors.orange);
    case SnackbarType.info:
      return (Colors.white, Colors.lightBlue);
  }
}
