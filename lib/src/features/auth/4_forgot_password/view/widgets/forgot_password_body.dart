import '../../../../../base/screens/exports.dart';
import '../../../2_sign_in/router/sign_in_route.dart';
import '../../../common/auth_body.dart';
import '../../vm/bloc/forgot_password_bloc.dart';
import '../../vm/states/forgot_password_states.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends SubWidget<ForgotPasswordBloc> {
  final ForgotPasswordState state;
  const ForgotPasswordBody(this.state, {super.key});

  @override
  Widget build(BuildContext context) => AuthBody(
    showOrDivider: false,
    buttonTitle: 'Next',
    accountQuestionFirstText: "",
    accountQuestionSecondText: "sign in",
    onAccountQuestionTap: () => globalContext.go(signInRoute.path),
    child: ForgotPasswordForm(
      step1FormKey: bloc.emailFormKey,
      step3FormKey: bloc.passwordFormKey,
      email: bloc.email,
      newPassword: bloc.newPassword,
      confirmPassword: bloc.confirmPassword,
      pinController: bloc.pinController.controller,
      pinFocusNode: bloc.pinController.node,
      pageController: bloc.pageController,
      currentStep: bloc.currentStep,
      pinFormKey: bloc.pinFormKey,
      isLoading: state is Loading,
      nextAction: bloc.next,
      previousAction: bloc.previous,
      onPinSubmitted: (code) => bloc.verifyResetCode(),
      resendPin: bloc.requestResetCode,
    ),
  );
}
