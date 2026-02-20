import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulfownsalesview/domain/notification/model/screen_notification_model.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState([])) {
    on<NotificationShowScreen>(_handleNotification);
  }

  _handleNotification(
    NotificationShowScreen event,
    Emitter<NotificationState> emit,
  ) {
    emit(NotificationState(List.from(state.notifications)..add(event.model)));
  }
}
