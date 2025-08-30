import '../../../../../base/screens/exports.dart';
import '../../../../../utils/input_validator.dart';
import '../../../../common/widgets/form_input.dart';
import 'package:easy_localization/easy_localization.dart';
import 'forgot_password_button.dart';

class SignInForm extends StatelessWidget {
  final Key formKey;
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final void Function()? onPasswordSubmitted;
  final void Function() onForgotPassword;

  const SignInForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.onForgotPassword,
    this.onPasswordSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //$ Inputs
          FormInput(
            label: LocaleKeys.auth_email.tr(),
            hint: LocaleKeys.auth_enter_email.tr(),
            type: FormInputType.email,
            controller: emailController,
            focusNode: emailFocusNode,
            nextFocusNode: passwordFocusNode,
            validator: InputValidators.validateEmail,
          ),
          VerticalSpacing(AppMetrics.spacing.md),
          FormInput(
            type: FormInputType.password,
            label: LocaleKeys.auth_password.tr(),
            hint: LocaleKeys.auth_enter_password.tr(),
            focusNode: passwordFocusNode,
            controller: passwordController,
            validator: InputValidators.validateLoginPassword,
            onFieldSubmitted: onPasswordSubmitted,
          ),
          //$ Forgot Password Button
          ForgotPasswordButton(onTap: onForgotPassword),
        ],
      ),
    );
  }
}
