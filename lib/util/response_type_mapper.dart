import 'package:gulfownsalesview/domain/common/enums/enum.dart';

ResponseType responseTypeFromApi(String? value) {
  switch (value?.toLowerCase()) {
    case 'completed':
      return ResponseType.completed;
    case 'hold':
      return ResponseType.hold;
    case 'dead':
      return ResponseType.dead;
    case 'inprogress':
    case 'in progress':
    default:
      return ResponseType.inProgress;
  }
}
