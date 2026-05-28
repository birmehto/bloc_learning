import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(_onLoginRequest);
    on<AuthLogoutRequest>(_onLogoutRequest);
  }

  Future<void> _onLoginRequest(
    AuthLoginRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final email = event.email;
      final password = event.password;

      if (password.length < 6) {
        emit(AuthError('Password cannot be less than 6'));

        return;
      }

      await Future.delayed(const Duration(seconds: 2));

      emit(AuthSuccess(userId: '$email-$password'));
    } catch (e) {
      log(e.toString());

      emit(AuthError(e.toString()));
    }
  }

  void _onLogoutRequest(AuthLogoutRequest event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    log('OnCahnge - $change');
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    log('$transition');
  }
}
