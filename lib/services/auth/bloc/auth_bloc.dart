/*External dependencies */
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
/*Local dependencies */
import 'package:finik/services/auth/auth_provider.dart';
import 'package:finik/services/auth/auth_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    AuthProvider provider,
  ) : super(const AuthStateLoading()) {
    // initialize
    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit(const AuthStateLogOut());
      } else if (!user.isEmailVerified) {
        emit(const AuthStateNeedsVerification());
      } else {
        emit(AuthStateLoggedIn(user));
      }
    });

    // sign up
    on<AuthEventSignUp>((event, emit) async {
      emit(const AuthStateLoading());
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.createUser(
          email: email,
          password: password,
        );
        emit(AuthStateSignedUp(user));
      } on Exception catch (e) {
        emit(AuthStateSignedUpFailure(e));
      }
    });

    // log in
    on<AuthEventLogIn>((event, emit) async {
      emit(const AuthStateLoading());
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.logIn(
          email: email,
          password: password,
        );
        emit(AuthStateLoggedIn(user));
      } on Exception catch (e) {
        emit(AuthStateLoggedInFailure(e));
      }
    });

    // log out
    on<AuthEventLogOut>(((event, emit) async {
      try {
        emit(const AuthStateLoading());
        await provider.logOut();
        emit(const AuthStateLogOut());
      } on Exception catch (e) {
        emit(AuthStateLogOutFailure(e));
      }
    }));
  }
}
