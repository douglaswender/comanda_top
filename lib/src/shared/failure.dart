import 'dart:developer';

final class Failure {
  final Object e;
  final StackTrace stacktrace;

  Failure(this.e, this.stacktrace) {
    log('${e.toString()} - $stacktrace');
  }
}
