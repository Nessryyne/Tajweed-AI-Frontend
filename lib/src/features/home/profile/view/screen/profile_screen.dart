import '../../../../../base/screens/exports.dart';
import '../../binding/profile_deps.dart';
import '../../vm/bloc/profile_bloc.dart';
import '../../vm/states/profile_states.dart';
import '../snackbars/_index.dart';
import 'widgets/profile_screen_body.dart';

final class ProfileScreen extends Feature<ProfileBloc, ProfileState> {
  ProfileScreen({super.key})
    : super(
        dependencies: ProfileDependencies().inject,
        onUpdate: (context, state) => switch (state) {
          Success() => appMessenger.showSnackBar(SuccessSnackbar()),
          Error() => appMessenger.showSnackBar(
            FailureSnackbar(message: state.message),
          ),
          _ => null,
        },
      );

  @override
  Widget build(BuildContext context, ProfileState state) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24),
          onPressed: () => globalContext.pop(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: ProfileScreenBody(),
    );
  }
}
