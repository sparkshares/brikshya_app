class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, "Request Time Out");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Server Error");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message])
      : super(message, "Invalid Exception Error");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "Fetch Data Error");
}
