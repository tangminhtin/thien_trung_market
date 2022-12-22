import 'package:thien_trung_market/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:thien_trung_market/core/usecases/usecase.dart';
import 'package:thien_trung_market/features/auth/domain/entities/auth.dart';
import 'package:thien_trung_market/features/auth/domain/repositories/auth_repository.dart';

class SignInWithFacebook implements UseCase<Auth, NoParams> {
  final AuthRepository authRepository;

  SignInWithFacebook(this.authRepository);

  Future<Either<Failure, Auth>?> execute(NoParams params) async {
    return await authRepository.signInWithFacebook();
  }
}
