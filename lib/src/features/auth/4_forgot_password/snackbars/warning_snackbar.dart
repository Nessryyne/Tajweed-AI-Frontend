import 'package:tajweed_ai/src/app/router/app_messenger.dart';

class WarningSnackbar extends CommonSnackbar {
  WarningSnackbar({required super.message})
    : super(
        type: SnackbarType.warning,
        actionTitle: 'Ok',
        defaultCloseButton: false,
      );
}
