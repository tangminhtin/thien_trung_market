import 'package:dartz/dartz.dart';
import 'package:thien_trung_market/core/error/failures.dart';
import 'package:thien_trung_market/features/auth/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>>? signInWithFacebook();
}
