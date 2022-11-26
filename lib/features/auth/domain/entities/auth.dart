import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String? userId;
  final String? email;
  final String? password;
  final String? token;

  const Auth({
    this.userId,
    this.email,
    this.password,
    this.token,
  });

  @override
  List<Object?> get props => [userId, email, password, token];
}
