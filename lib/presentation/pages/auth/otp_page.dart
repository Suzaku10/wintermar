import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wintermar/domain/constant/app_enum.dart';
import 'package:wintermar/presentation/components/app_button.dart';
import 'package:wintermar/presentation/pages/auth/components/otp_widgets.dart';
import 'package:wintermar/presentation/pages/auth/components/resend_code_widgets.dart';

@RoutePage()
class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OTPWidgets(phoneNumber: ' +6285718484347',otpShape: OTPShape.circle,),
                  ResendCodeWidgets(),
                ],
              ),
            ),
          ),
          AppButton.defaults(title: 'Send OTP')
        ],
      ),
    );
  }
}
