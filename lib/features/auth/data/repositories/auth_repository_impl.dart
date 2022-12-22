import 'package:thien_trung_market/core/error/exceptions.dart';
import 'package:thien_trung_market/core/network/network_info.dart';
import 'package:thien_trung_market/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:thien_trung_market/features/auth/data/models/auth_model.dart';
import 'package:thien_trung_market/features/auth/domain/entities/auth.dart';
import 'package:thien_trung_market/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:thien_trung_market/features/auth/domain/repositories/auth_repository.dart';

typedef Future<AuthModel> _AuthAB();

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  const AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Auth>>? signInWithFacebook() async {
    return await _getAuth(() {
      return authRemoteDataSource.signInWithFacebook();
    });
  }

  Future<Either<Failure, Auth>> _getAuth(_AuthAB getAuth) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getAuth();
        // localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try {
      //   final localTrivia = await localDataSource.getLastNumberTrivia();
      //   return Right(localTrivia!);
      // } on CacheException {
      return Left(CacheFailure());
      // }
    }
  }
}
