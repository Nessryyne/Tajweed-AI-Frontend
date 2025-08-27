import 'package:flutter/material.dart';
import 'package:cg_core_defs/cg_core_defs.dart';
import 'package:tajweed_ai/src/features/auth/2_sign_in/router/sign_in_route.dart';

import '../../../../../base/bloc/exports.dart';
import '../../../../../utils/input_validator.dart';
import '../../data/models/forgot_password_model.dart';
import '../../data/models/reset_password_model.dart';
import '../../datasource/forgot_password_datasource.dart';
import '../events/forgot_password_events.dart';
import '../states/forgot_password_states.dart';

part '../usecases/forgot_password_uc.dart';

class ForgotPasswordBloc
    extends BaseBloc<ForgotPasswordEvent, ForgotPasswordState> {
  //! Data Sources
  final ForgotPasswordDataSource _forgotPasswordDataSource;

  //! Form keys
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pinFormKey = GlobalKey<FormState>();
  //! Input Controllers
  late final List<InputControl> inputControllers;
  late final InputControl email;
  late final InputControl newPassword;
  late final InputControl confirmPassword;
  late final InputControl pinController;

  //! Step management
  final Observable<int> currentStep = Observable<int>(0);
  final PageController pageController = PageController();

  //! Token
  final Observable<String> token = Observable<String>('');

  //! Event Callers
  void next() => add(NextStep(currentStep.value));
  void previous() => add(PreviousStep(currentStep.value));
  void requestResetCode() => add(ResendPin(email.getText()));
  void verifyResetCode() => add(
    VerifyResetCode(
      email: email.getText(),
      code: pinController.controller.text.trim(),
    ),
  );

  ForgotPasswordBloc(this._forgotPasswordDataSource)
    : super(Idle(), debugginEnabled: true) {
    on<RequestResetCode>(_requestResetCode);
    on<ResendPin>(_requestResetCode2);
    on<VerifyResetCode>(_verifyResetCode);
    on<ResetPassword>(_resetPassword);
    on<NextStep>(_next);
    on<PreviousStep>(_previousStep);
  }

  @override
  void onInit() {
    inputControllers = InputControl.generate(4);
    email = inputControllers[0];
    newPassword = inputControllers[1];
    confirmPassword = inputControllers[2];
    pinController = inputControllers[3];
    super.onInit();
  }

  @override
  Future<void> close() {
    inputControllers.disposeAll();
    return super.close();
  }
}
