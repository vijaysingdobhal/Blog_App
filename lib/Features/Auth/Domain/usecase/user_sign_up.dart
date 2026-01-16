import 'package:blogapp/Core/error/failures.dart';
import 'package:blogapp/Core/usecase/usecase.dart';
import 'package:fpdart/src/either.dart';

import '../repository/auth_repository.dart';

class UserSignUp implements Usecase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signupWithEmailPassword(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String username;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.username,
  });
}
