import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thien_trung_market/core/error/failures.dart';
import 'package:thien_trung_market/core/usecases/usecase.dart';
import 'package:thien_trung_market/features/auth/domain/entities/auth.dart';
import 'package:thien_trung_market/features/auth/domain/repositories/auth_repository.dart';
import 'package:thien_trung_market/features/auth/domain/usecases/sign_in_with_facebook.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

@GenerateMocks([AuthRepository])
void main() {
  MockAuthRepository? mockAuthRepository;
  SignInWithFacebook? usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SignInWithFacebook(mockAuthRepository!);
  });

  Auth auth = const Auth();
  test(
    'should sign in with facebook from the repository',
    () async {
      // arrange

      when(mockAuthRepository!.signInWithFacebook())
          .thenAnswer((r) async => Right(auth));

      // act
      final Either<Failure, Auth>? result = await usecase!.execute(NoParams());

      // assert
      expect(result, Right(auth));
      verify(mockAuthRepository!.signInWithFacebook());
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
