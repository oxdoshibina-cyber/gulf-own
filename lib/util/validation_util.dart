// ignore_for_file: deprecated_member_use

class ValidationUtil {
  ValidationUtil._();
  static String? validation(value) {
    RegExp regex = RegExp(r'^.{0,}$');
    if (value!.isEmpty) {
      return ("Enter The Field");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid data");
    }
    return null;
  }
}
