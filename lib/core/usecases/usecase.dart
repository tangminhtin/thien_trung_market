import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:thien_trung_market/core/error/failures.dart';

/// Use Case
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// No Params
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
