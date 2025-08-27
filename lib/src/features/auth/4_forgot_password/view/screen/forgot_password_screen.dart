import '../../../../../base/screens/exports.dart';
import '../../snackbars/_index.dart';
import '../widgets/forgot_password_body.dart';
import '../../binding/forgot_password_deps.dart';
import '../../vm/bloc/forgot_password_bloc.dart';
import '../../vm/states/forgot_password_states.dart';

class ForgotPasswordScreen
    extends Feature<ForgotPasswordBloc, ForgotPasswordState> {
  ForgotPasswordScreen({super.key})
    : super(
        dependencies: ForgotPasswordDependencies().inject,
        onUpdate: (context, state) => switch (state) {
          Error() => appMessenger.showSnackBar(
            FailureSnackbar(message: state.message),
          ),
          Success() => appMessenger.showSnackBar(
            SuccessSnackbar(message: state.message),
          ),
          _ => null,
        },
      );

  @override
  Widget build(BuildContext context, ForgotPasswordState state) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: ForgotPasswordBody(state),
    );
  }
}
