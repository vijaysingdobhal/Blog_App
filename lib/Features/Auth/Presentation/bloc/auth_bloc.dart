import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/usecase/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // This is the correct field to use.
  final UserSignUp userSignUp;

  AuthBloc({
    // Use 'this.userSignUp' for direct initialization.
    required this.userSignUp,
  }) : super(AuthInitial()) {
    on<AuthSignup>((event, emit) async {
      // Call the use case using the 'userSignUp' field, not '_userSignUp'.
      final res = await userSignUp(
        UserSignUpParams(
          email: event.email,
          password: event.password,
          username: event.username,
        ),
      );
      res.fold(
            (failure) => emit(AuthFailure(failure.massage)),
            (uid) => emit(AuthSuccess(uid)),
      );
    });
  }
}
