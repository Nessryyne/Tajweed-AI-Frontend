import '../../../../../base/screens/exports.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessSnackbar extends CommonSnackbar {
  SuccessSnackbar()
    : super(
        message: LocaleKeys.common_successfully_signed_in.tr(),
        type: SnackbarType.success,
      );
}
