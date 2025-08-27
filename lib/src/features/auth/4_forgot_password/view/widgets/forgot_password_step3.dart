part of 'forgot_password_form.dart';

class _ForgotPasswordStep3 extends StatelessWidget {
  final Key formKey;
  final InputControl newPassword;
  final InputControl confirmPassword;

  const _ForgotPasswordStep3({
    super.key,
    required this.formKey,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: Column(
      children: [
        VerticalSpacing(AppMetrics.spacing.lg),
        FormInput(
          type: FormInputType.password,
          label: 'New Password',
          controller: newPassword.controller,
          focusNode: newPassword.node,
          nextFocusNode: confirmPassword.node,
          validator: InputValidators.validatePassword,
        ),
        VerticalSpacing(AppMetrics.spacing.md),
        FormInput(
          type: FormInputType.password,
          label: 'Confirm New Password',
          controller: confirmPassword.controller,
          focusNode: confirmPassword.node,
          validator: (value) => InputValidators.validateConfirmPassword(
            value,
            newPassword.controller.text,
          ),
        ),
        VerticalSpacing(AppMetrics.spacing.lg),
      ],
    ),
  );
}
