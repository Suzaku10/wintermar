import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wintermar/presentation/pages/auth/components/resend_code_widgets.dart';

@RoutePage()
class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ResendCodeWidgets(),
      ),
    );
  }
}
