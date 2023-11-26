import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wintermar/domain/constant/app_assets.dart';
import 'package:wintermar/domain/constant/app_pages.dart';
import 'package:wintermar/domain/constant/app_text_styles.dart';
import 'package:wintermar/presentation/components/app_button.dart';
import 'package:wintermar/presentation/components/app_text_field.dart';
import 'package:wintermar/presentation/pages/auth/components/greeting_widgets.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';
import 'package:wintermar/utilities/validator/input_validator.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GreetingsWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32).copyWith(bottom: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField.defaults(
                      controller: _usernameController,
                      label: I10n.current.username,
                      hint: I10n.current.hint_username,
                      validator: (value) => InputValidatorUtils.name(value),
                    ),
                    const SizedBox(height: 24),
                    AppTextField.defaults(
                      controller: _passwordController,
                      label: I10n.current.password,
                      hint: I10n.current.hint_password,
                      validator: (value) => InputValidatorUtils.password(value),
                      obscure: !_showPassword,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: () => setState(() => _showPassword = !_showPassword),
                          child: SvgPicture.asset(AppAssets.icPassword, width: 24, height: 24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    AppButton.defaults(title: I10n.current.login_now, onPressed: _doLogin, assets: AppAssets.icArrowRight),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                      text: I10n.current.have_account,
                      children: [
                        const TextSpan(text: "\t\t\t"),
                        TextSpan(
                          text: I10n.current.register_now,
                          style: AppStyles.textSm.primary,
                          recognizer: TapGestureRecognizer()..onTap = () => context.router.replaceNamed(AppPages.registerRoute),
                        )
                      ],
                      style: AppStyles.textSm.primary.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _doLogin() async {
    try {
      if (_formKey.currentState!.validate()) {}
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
