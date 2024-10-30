
class AppExceptions implements Exception {
  String? message;
  String? prefix;

  AppExceptions([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message!, 'No Internet');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message!, 'Invalid url exception');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message!, 'Data not fetched');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message]) : super(message!, 'Request Time Out');
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message!, 'Internal Server error');
}
