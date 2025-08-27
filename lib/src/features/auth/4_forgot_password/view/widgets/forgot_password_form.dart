import 'package:pinput/pinput.dart';
import '../../../../../base/screens/exports.dart';
import '../../../../../utils/input_validator.dart';
import '../../../../common/widgets/animated_stepper.dart';
import '../../../../common/widgets/form_input.dart';
import '../../../../common/widgets/custom_text_button.dart';

part 'forgot_password_step1.dart';
part 'forgot_password_step2.dart';
part 'forgot_password_step3.dart';
part 'forgot_password_form_builder.dart';
part 'forgot_password_actions.dart';

class ForgotPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> step1FormKey;
  final GlobalKey<FormState> step3FormKey;
  final InputControl email;
  final InputControl newPassword;
  final InputControl confirmPassword;
  final TextEditingController pinController;
  final FocusNode pinFocusNode;
  final PageController pageController;
  final Observable<int> currentStep;
  final GlobalKey<FormState> pinFormKey;
  final bool isLoading;
  final void Function() nextAction;
  final void Function()? previousAction;
  final void Function(String) onPinSubmitted;
  final void Function() resendPin;

  const ForgotPasswordForm({
    super.key,
    required this.step1FormKey,
    required this.step3FormKey,
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
    required this.pinController,
    required this.pinFocusNode,
    required this.pageController,
    required this.currentStep,
    required this.pinFormKey,
    required this.isLoading,
    required this.nextAction,
    this.previousAction,
    required this.onPinSubmitted,
    required this.resendPin,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      RepaintBoundary(
        child: AnimatedStepper(length: 3, currentStep: currentStep),
      ),

      _ForgotPasswordFormBuilder(
        controller: pageController,
        widgets: [
          _ForgotPasswordStep1(formKey: step1FormKey, email: email),
          _ForgotPasswordStep2(
            pinController: pinController,
            pinFocusNode: pinFocusNode,
            onCompleted: onPinSubmitted,
            resend: resendPin,
            pinFormKey: pinFormKey,
          ),
          _ForgotPasswordStep3(
            formKey: step3FormKey,
            newPassword: newPassword,
            confirmPassword: confirmPassword,
          ),
        ],
      ),
      _ForgotPasswordActions(
        index: currentStep,
        onNext: nextAction,
        onPrevious: previousAction,
        isLoading: isLoading,
      ),
      VerticalSpacing(AppMetrics.spacing.md),
    ],
  );
}
