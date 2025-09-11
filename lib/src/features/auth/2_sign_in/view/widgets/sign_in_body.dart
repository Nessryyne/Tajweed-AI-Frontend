//? Base needed imports
import 'package:easy_localization/easy_localization.dart';

import '../../../../../base/screens/exports.dart';

import '/src/features/auth/2_sign_in/view/widgets/sign_in_form.dart';
import '../../../common/auth_body.dart';

import '../../../3_sign_up/router/sign_up_route.dart';
import '../../../4_forgot_password/router/forgot_password_route.dart';

//? Bloc needed imports
import '../../vm/bloc/sign_in_bloc.dart';
import '../../vm/states/sign_in_states.dart';

class SignInBody extends SubWidget<SignInBloc> {
  final SignInState state;
  const SignInBody(this.state, {super.key});

  @override
  Widget build(BuildContext context) => AuthBody(
    buttonTitle: LocaleKeys.auth_sign_in.tr(),
    isLoading: state is Loading,
    showOrDivider: true,
    showSocialLogin: true,
    showGuestOption: true,
    accountQuestionFirstText: LocaleKeys.auth_dont_have_account.tr(),
    accountQuestionSecondText: LocaleKeys.auth_create_one.tr(),
    onAccountQuestionTap: () => globalContext.go(signUpRoute.path),
    guestQuestionFirstText: LocaleKeys.auth_or_continue_as.tr(),
    guestQuestionSecondText: LocaleKeys.auth_guest.tr(),
    onButtonTap: bloc.signInWithEmailAndPassword,
    onGuestQuestionTap: bloc.continueAsGuest,
    onGoogleTap: bloc.signInWithGoogle,
    onFacebookTap: bloc.signInWithFacebook,
    onAppleTap: bloc.signInWithApple,
    child: SignInForm(
      formKey: bloc.formKey,
      emailController: bloc.email.controller,
      emailFocusNode: bloc.email.node,
      passwordController: bloc.password.controller,
      passwordFocusNode: bloc.password.node,
      onForgotPassword: () => globalContext.push(forgotPasswordRoute.path),
    ),
  );
}
