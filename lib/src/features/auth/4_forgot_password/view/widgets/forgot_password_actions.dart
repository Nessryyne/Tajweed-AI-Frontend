part of 'forgot_password_form.dart';

class _ForgotPasswordActions extends StatelessWidget {
  final Observable<int> index;
  final void Function() onNext;
  final void Function()? onPrevious;
  final bool isLoading;

  const _ForgotPasswordActions({
    super.key,
    required this.index,
    required this.onNext,
    this.onPrevious,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) => Observer(
    observes: index,
    builder: (BuildContext context, index) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (index == 1) ...[
          OutlinedLoadingButton(
            title: 'Previous',
            onTap: onPrevious ?? () {},
            titleFontSize: FontSizes.title,
            height: AppMetrics.buttons.elevated.height,
          ).expanded(),
          const HorizontalSpacing(10),
        ],
        LoadingButton(
          title: index == 0
              ? 'Next'
              : index == 1
              ? 'Verify Code'
              : 'Reset Password',
          onTap: onNext,
          isLoading: isLoading,
          titleFontSize: FontSizes.title,
          height: AppMetrics.buttons.elevated.height,
          useGradient: true,
        ).expanded(),
      ],
    ),
  );
}
