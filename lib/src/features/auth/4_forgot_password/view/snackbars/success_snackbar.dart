import '../../../../../base/screens/exports.dart';

class SuccessSnackbar extends SnackBar {
  SuccessSnackbar({required String message})
    : super(content: Text(message), backgroundColor: AppColors.success);
}


