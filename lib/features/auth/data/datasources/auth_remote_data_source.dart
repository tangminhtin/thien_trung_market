import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:thien_trung_market/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> signInWithFacebook();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthModel> signInWithFacebook() => _signInWithFacebook();

  Future<AuthModel> _signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      print(accessToken);
    } else {
      print(result.status);
      print(result.message);
    }

    return AuthModel(
      userId: 'userId',
      email: 'email',
      password: 'password',
      token: 'token',
    );
  }
}
