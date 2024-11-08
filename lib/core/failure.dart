import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int code;
  final String message;

  const Failure(
    this.code,
    this.message,
  );

  @override
  List<Object> get props => [
        code,
        message,
      ];
}

class GeneralFailure extends Failure {
  const GeneralFailure(super.code, super.message);
}
