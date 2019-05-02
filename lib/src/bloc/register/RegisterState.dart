import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super(props);
}

class RegisterInitial extends RegisterState {
  @override
  String toString() => 'RegisterInitial';
}

class RegisterLoading extends RegisterState {
  @override
  String toString() => 'RegisterLoading';
}

class RegisterSuccess extends RegisterState {
  @override
  String toString() => 'RegisterSuccess';
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'LoginFailure { error: $error }';
}
