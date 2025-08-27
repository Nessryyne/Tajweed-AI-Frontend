part of 'forgot_password_form.dart';

class _ForgotPasswordFormBuilder extends StatelessWidget {
  final PageController controller;
  final List<Widget> widgets;

  const _ForgotPasswordFormBuilder({
    super.key,
    required this.controller,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widgets.length,
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          SingleChildScrollView(child: widgets[index]),
    ).resize(height: AppMetrics.scaffold.horizontalBodyPadding * 12);
  }
}
