part of 'forgot_password_form.dart';

class _ForgotPasswordStep2 extends StatelessWidget {
  final TextEditingController pinController;
  final FocusNode pinFocusNode;
  final void Function(String) onCompleted;
  final void Function() resend;
  final GlobalKey<FormState> pinFormKey;
  const _ForgotPasswordStep2({
    super.key,
    required this.pinController,
    required this.pinFocusNode,
    required this.onCompleted,
    required this.resend,
    required this.pinFormKey,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: AppStyles.headline3.semiBold().copyWith(
        color: AppColors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VerticalSpacing(AppMetrics.scaffold.horizontalBodyPadding),
        Text(
          "Check your inbox 📩",
          style: AppStyles.headline4.bold().copyWith(color: AppColors.tertiary),
        ),
        const SizedBox(height: 8),
        Text(
          "We've sent you a 4-digit verification code to your email. "
          "Please enter it below to continue.",
          style: AppStyles.indication.semiBold().copyWith(
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
        VerticalSpacing(AppMetrics.scaffold.horizontalBodyPadding),
        Form(
          key: pinFormKey,
          child: Pinput(
            validator: (value) => value?.length == 4 ? null : "Invalid code",
            autofillHints: const [AutofillHints.oneTimeCode],
            enableSuggestions: false,
            autofocus: true,
            length: 4,
            controller: pinController,
            focusNode: pinFocusNode,
            pinAnimationType: PinAnimationType.fade,
            onCompleted: onCompleted,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.accent),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.success),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.error),
              ),
            ),
            cursor: Container(
              width: 10,
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        VerticalSpacing(AppMetrics.scaffold.horizontalBodyPadding / 2),
        Row(
          children: [
            const Spacer(),
            CustomTextButton(
              title: 'resend code',
              onTap: resend,
              textColor: AppColors.primary,
            ),
          ],
        ).symmetricPadding(vertical: 8),
        VerticalSpacing(AppMetrics.spacing.lg),
      ],
    );
  }
}
