import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../Core/ServerException/ServerException.dart';

abstract interface class AuthDatasource {
  Future<String> SignUpWithEmailPassword({
    required String email,
    required String password,
    required String username,
  });
  Future<String> LoginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthDatasourceImpl implements AuthDatasource {
  final SupabaseClient supabaseClient;
  AuthDatasourceImpl(this.supabaseClient);

  @override
  Future<String> SignUpWithEmailPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );
      if (response.user == null) {
        throw const Serverexception('User Null');
      }
      return Future.value(response.user!.id);
    } catch (e) {
      throw Serverexception(e.toString());
    }
  }

  @override
  Future<String> LoginWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
