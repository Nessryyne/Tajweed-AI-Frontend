part of 'forgot_password_form.dart';

class _ForgotPasswordStep1 extends StatelessWidget {
  final Key formKey;
  final InputControl email;

  const _ForgotPasswordStep1({
    super.key,
    required this.formKey,
    required this.email,
  });

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: Column(
      children: [
        VerticalSpacing(AppMetrics.spacing.lg),
        Text(
          "Please enter your email address below to receive a verification code.",
          style: AppStyles.indication.semiBold().copyWith(
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
        VerticalSpacing(AppMetrics.scaffold.horizontalBodyPadding),
        FormInput(
          label: 'Email',
          type: FormInputType.email,
          controller: email.controller,
          focusNode: email.node,
          validator: InputValidators.validateEmail,
        ),
        VerticalSpacing(AppMetrics.spacing.lg),
      ],
    ),
  );
}
