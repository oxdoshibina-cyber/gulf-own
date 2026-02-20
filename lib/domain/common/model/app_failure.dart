enum AppFailureType { client, server, network, unknown, sessionExpired }

class AppFailure {
  final AppFailureType type;
  final String message;
  final int statusCode;

  const AppFailure({
    required this.type,
    required this.message,
    required this.statusCode,
  });

  // Factory constructor to create AppFailure based on the statusCode

  // Private constructors for specific error types
  factory AppFailure.client(String message) {
    return AppFailure(
      type: AppFailureType.client,
      message: message,
      statusCode: -1,
    );
  }

  factory AppFailure.server(String message, int statusCode) {
    return AppFailure(
      type: AppFailureType.server,
      message: message,
      statusCode: statusCode,
    );
  }

  factory AppFailure.network(String message) {
    return AppFailure(
      type: AppFailureType.network,
      message: message,
      statusCode: -1, // Default status code for network errors
    );
  }

  factory AppFailure.unknown(String message) {
    return AppFailure(
      type: AppFailureType.unknown,
      message: message,
      statusCode: 0, // Default status code for unknown errors
    );
  }
  factory AppFailure.sessionExpired(String message) {
    return AppFailure(
      type: AppFailureType.sessionExpired,
      message: message,
      statusCode: 401, // typical unauthorized code
    );
  }
}
