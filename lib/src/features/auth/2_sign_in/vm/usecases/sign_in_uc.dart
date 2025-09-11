part of '../bloc/sign_in_bloc.dart';

//- Sign In
extension on SignInBloc {
  Future<void> _signInWithEmailAndPassword(
    SignInWithEmailAndPassword event,
    Emitter<SignInState> emit,
  ) async {
    if (formKey.isUnvalid) return;

    emit(Loading());
    return await _signInDataSource
        .signInWithEmailAndPassword(event.email, event.password)
        .then(
          (response) => response.fold(
            (exception) => _handleSignInFailure(exception, emit),
            (data) => _saveTokensAndEmitSuccess(data, emit),
          ),
        );
  }

  Future<void> _saveTokensAndEmitSuccess(
    SignInModelResponse data,
    Emitter<SignInState> emit,
  ) async {
    if (data.success && data.data != null) {
      await _signInDataSource.saveTokens(
        accessToken: data.data!.access,
        refreshToken: data.data!.refresh,
      );
      emit(Success(data.message));
      if (globalContext.mounted) globalContext.go("/home");
    } else {
      emit(Error.from(Exception(data.message)));
    }
  }

  Future<void> _signInWithApple(
    SignInWithApple event,
    Emitter<SignInState> emit,
  ) async {
    //TODO: Implement sign in with apple
  }

  Future<void> _signInWithGoogle(
    SignInWithGoogle event,
    Emitter<SignInState> emit,
  ) async {
    emit(GoogleLoadingState());
    return await _signInDataSource
        .socialLogin(SocialLoginSource.google)
        .then(
          (response) => response.fold(
            (exception) => _handleSignInFailure(exception, emit),
            (data) => _saveTokensAndEmitSuccess(data, emit),
          ),
        );
  }

  Future<void> _signInWithFacebook(
    SignInWithFacebook event,
    Emitter<SignInState> emit,
  ) async {
    //TODO: Implement sign in with facebook
  }
}

void _handleSignInFailure(Exception exception, Emitter<SignInState> emit) =>
    emit(Error.from(exception));
