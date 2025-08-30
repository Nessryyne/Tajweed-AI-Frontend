import '../../../../common/widgets/custom_text_button.dart';
import '../../../../../base/screens/exports.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgotPasswordButton extends StatelessWidget {
  final VoidCallback onTap;
  const ForgotPasswordButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Spacer(),
      CustomTextButton(
        title: LocaleKeys.auth_forgot_password.tr(),
        onTap: onTap,
        textColor: AppColors.primary,
      ),
    ],
  ).symmetricPadding(vertical: 8);
}
