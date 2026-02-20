part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final List<ScreenNotificationModel> notifications;

  const NotificationState(this.notifications);

  @override
  List<Object> get props => [notifications];
}
