import '../../../../../base/screens/exports.dart';

class WarningSnackbar extends SnackBar {
  WarningSnackbar({required String message})
    : super(content: Text(message), backgroundColor: AppColors.warning);
}


