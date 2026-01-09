import 'package:blogapp/Core/error/failures.dart';
import 'package:fpdart/src/either.dart';
import '../../Core/ServerException/ServerException.dart';
import '../Auth/Data/datasource/auth_datasource.dart';
import '../Auth/Domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource remoteDatasource;
  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signupWithEmailPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final userId = await remoteDatasource.SignUpWithEmailPassword(
        email: email,
        password: password,
        username: username,
      );
      return right(userId);
    } on Serverexception catch (e) {
      return left(Failure(e.massage));
    }
  }
}
