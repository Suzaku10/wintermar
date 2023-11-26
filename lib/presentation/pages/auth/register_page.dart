import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wintermar/application/auth_store.dart';
import 'package:wintermar/domain/constant/app_assets.dart';
import 'package:wintermar/domain/constant/app_pages.dart';
import 'package:wintermar/domain/constant/app_text_styles.dart';
import 'package:wintermar/domain/request/user_request.dart';
import 'package:wintermar/presentation/components/app_button.dart';
import 'package:wintermar/presentation/components/app_text_field.dart';
import 'package:wintermar/presentation/pages/auth/components/greeting_widgets.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';
import 'package:wintermar/utilities/injection/injection.dart';
import 'package:wintermar/utilities/router/app_router.dart';
import 'package:wintermar/utilities/utilities.dart';
import 'package:wintermar/utilities/validator/input_validator.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthStore _authStore = getIt<AuthStore>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmationPassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                      controller: _emailController,
                      label: I10n.current.email,
                      hint: I10n.current.hint_email,
                      inputType: TextInputType.emailAddress,
                      validator: (value) => InputValidatorUtils.email(value),
                    ),
                    const SizedBox(height: 24),
                    AppTextField.defaults(
                      controller: _phoneController,
                      label: I10n.current.phone_number,
                      hint: I10n.current.hint_phone_number,
                      inputType: TextInputType.phone,
                      validator: (value) => InputValidatorUtils.phoneNumber(value),
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
                    AppTextField.defaults(
                      controller: _confirmPasswordController,
                      label: I10n.current.confirm_password,
                      hint: I10n.current.hint_confirm_password,
                      validator: (value) => InputValidatorUtils.confirmPassword(value, password: _passwordController.text),
                      obscure: !_showConfirmationPassword,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: () => setState(() => _showConfirmationPassword = !_showConfirmationPassword),
                          child: SvgPicture.asset(AppAssets.icPassword, width: 24, height: 24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    AppButton.defaults(title: I10n.current.register, onPressed: _doRegister, assets: AppAssets.icArrowRight),
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
                          text: I10n.current.login_now,
                          style: AppStyles.textSm.primary,
                          recognizer: TapGestureRecognizer()..onTap = () => context.router.replaceNamed(AppPages.loginRoute),
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

  void _doRegister() async {
    try {
      if (_formKey.currentState!.validate()) {
        showLoading();
        final response =await _authStore.register(UserRequest(_emailController.text, _usernameController.text, _passwordController.text, _phoneController.text));
        dismissLoading();
        if (response) context.router.replaceAll([const OTPRoute()]);
      }
    } catch (e) {
      showError(e);
    }
  }
}
