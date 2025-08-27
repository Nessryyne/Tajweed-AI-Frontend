part of '../bloc/forgot_password_bloc.dart';

extension on ForgotPasswordBloc {
  Future<void> _requestResetCode(
    RequestResetCode event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (emailFormKey.isUnvalid) return;
    emit(Loading());
    return await _forgotPasswordDataSource
        .requestResetCode(email: event.email)
        .then(
          (response) => response.fold(
            (exception) => _handleRequestResetCodeFailure(exception, emit),
            (data) => _handleRequestResetCodeSuccess(
              data,
              emit,
              currentStep,
              pageController,
            ),
          ),
        );
  }

  Future<void> _requestResetCode2(
    ResendPin event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (emailFormKey.isUnvalid) return;
    return await _forgotPasswordDataSource
        .requestResetCode(email: event.email)
        .then(
          (response) => response.fold(
            (exception) => _handleRequestResetCodeFailure(exception, emit),
            (data) => _handleRequestResetCodeSuccess(
              data,
              emit,
              currentStep,
              pageController,
            ),
          ),
        );
  }

  Future<void> _verifyResetCode(
    VerifyResetCode event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (pinFormKey.isUnvalid) return;
    emit(Loading());
    return await _forgotPasswordDataSource
        .verifyResetCode(email: event.email, code: event.code)
        .then(
          (response) => response.fold(
            (exception) => _handleVerifyResetCodeFailure(exception, emit),
            (data) => _handleVerifyResetCodeSuccess(
              data,
              emit,
              currentStep,
              pageController,
              token,
            ),
          ),
        );
  }

  Future<void> _resetPassword(
    ResetPassword event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    Debugger.red(event.token);
    if (passwordFormKey.isUnvalid) return;
    emit(Loading());
    return await _forgotPasswordDataSource
        .resetPassword(token: event.token, newPassword: event.newPassword)
        .then(
          (response) => response.fold(
            (exception) => _handleResetPasswordFailure(exception, emit),
            (data) => _handleResetPasswordSuccess(data, emit),
          ),
        );
  }

  Future<void> _next(NextStep event, Emitter<ForgotPasswordState> emit) async =>
      switch (event.current) {
        0 => add(RequestResetCode(email.getText())),
        1 => add(
          VerifyResetCode(
            email: email.getText(),
            code: pinController.controller.text,
          ),
        ),
        2 => add(
          ResetPassword(token: token.value, newPassword: newPassword.getText()),
        ),
        _ => null,
      };

  void _previousStep(PreviousStep event, Emitter<ForgotPasswordState> emit) {
    if (currentStep.value > 0) {
      currentStep.value -= 1;
      pageController.animateToPage(
        currentStep.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}

void _goToNextStep(
  Emitter<ForgotPasswordState> emit,
  Observable<int> currentIndex,
  PageController controller,
) {
  if (currentIndex.value < 2) {
    currentIndex.value += 1;
    controller.animateToPage(
      currentIndex.value,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

void _handleRequestResetCodeFailure(
  Exception exception,
  Emitter<ForgotPasswordState> emit,
) => emit(Error.from(exception));

void _handleRequestResetCodeSuccess(
  ForgotPasswordModelResponse data,
  Emitter<ForgotPasswordState> emit,
  Observable<int> currentStep,
  PageController pageController,
) {
  if (data.success) {
    emit(Success("Reset code sent to your email"));
    if (currentStep.value == 0) {
      _goToNextStep(emit, currentStep, pageController);
    }
  } else {
    emit(Error.from(Exception(data.info)));
  }
}

void _handleVerifyResetCodeFailure(
  Exception exception,
  Emitter<ForgotPasswordState> emit,
) => emit(Error.from(exception));

void _handleVerifyResetCodeSuccess(
  ForgotPasswordModelResponse data,
  Emitter<ForgotPasswordState> emit,
  Observable<int> currentStep,
  PageController pageController,
  Observable<String> token,
) {
  if (data.success) {
    emit(Success("Code verified successfully"));
    _goToNextStep(emit, currentStep, pageController);
    token.value = data.token;
  } else {
    emit(Error.from(Exception(data.info)));
  }
}

void _handleResetPasswordFailure(
  Exception exception,
  Emitter<ForgotPasswordState> emit,
) => emit(Error.from(exception));

void _handleResetPasswordSuccess(
  ResetPasswordModelResponse data,
  Emitter<ForgotPasswordState> emit,
) {
  if (data.success) {
    emit(Success("Password reset successfully"));
    globalContext.go(signInRoute.path);
  } else {
    emit(Error.from(Exception(data.info)));
  }
}
