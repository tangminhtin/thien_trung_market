import 'package:equatable/equatable.dart';

/// Failure
abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Server failure
class ServerFailure extends Failure {}

/// Cache failure
class CacheFailure extends Failure {}
