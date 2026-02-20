part of 'notification_bloc.dart';

class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class NotificationShowScreen extends NotificationEvent {
  final ScreenNotificationModel model;

  const NotificationShowScreen({required this.model});

  @override
  List<Object?> get props => [model];
}
