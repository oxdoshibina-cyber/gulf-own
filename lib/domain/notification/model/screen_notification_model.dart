import 'dart:ui';
import 'package:equatable/equatable.dart';

enum NotificationType {
  error,
  success,
  warning,
  info;

  String toTitle() {
    switch (this) {
      case error:
        return "Error!...";
      case success:
        return "Success";
      case warning:
        return "Need your attention here";
      case info:
        return "Info";
    }
  }
}

class ScreenNotificationModel extends Equatable {
  final String title;
  final String message;
  final NotificationType type;
  final VoidCallback? callback;
  final dynamic data;
  final Duration? duration;
  final bool isIgnorable;
  final String actionLabel;

  const ScreenNotificationModel({
    required this.title,
    required this.message,
    required this.type,
    this.data,
    this.callback,
    this.isIgnorable = false,
    this.duration,
    this.actionLabel = "Retry",
  });

  @override
  List<Object?> get props => [
        title,
        message,
        type,
        callback,
        data,
        duration,
        actionLabel,
      ];
}

