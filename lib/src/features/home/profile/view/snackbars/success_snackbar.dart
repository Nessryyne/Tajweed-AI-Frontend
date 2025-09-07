import '../../../../../base/screens/exports.dart';

class SuccessSnackbar extends CommonSnackbar {
  SuccessSnackbar()
    : super(
        message: 'Profile updated successfully',
        type: SnackbarType.success,
      );
}
