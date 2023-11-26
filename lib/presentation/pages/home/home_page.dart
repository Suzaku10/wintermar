import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wintermar/application/auth_store.dart';
import 'package:wintermar/domain/constant/app_colors.dart';
import 'package:wintermar/domain/constant/app_text_styles.dart';
import 'package:wintermar/presentation/pages/home/components/placeholder_widgets.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';
import 'package:wintermar/utilities/injection/injection.dart';
import 'package:wintermar/utilities/router/app_router.dart';
import 'package:wintermar/utilities/utilities.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthStore _authStore = getIt<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton.outlined(onPressed: _doLogout, icon: const Icon(Icons.logout))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Observer(
              builder: (_) => Shimmer.fromColors(
                baseColor: AppColors.primary,
                highlightColor: AppColors.white,
                child: Text.rich(
                  TextSpan(
                    text: I10n.current.greetings,
                    children: [
                      TextSpan(text: ' ${_authStore.username}', style: AppStyles.displayLg.bold.primary),
                    ],
                  ),
                  style: AppStyles.displayLg.primary,
                ),
              ),
            ),
          ),
          Flexible(
            child: _shimmer(),
          )
        ],
      ),
    );
  }

  Widget _shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            BannerPlaceholder(),
            TitlePlaceholder(width: double.infinity),
            SizedBox(height: 16.0),
            ContentPlaceholder(
              lineType: ContentLineType.threeLines,
            ),
            SizedBox(height: 16.0),
            TitlePlaceholder(width: 200.0),
            SizedBox(height: 16.0),
            ContentPlaceholder(
              lineType: ContentLineType.twoLines,
            ),
            SizedBox(height: 16.0),
            TitlePlaceholder(width: 200.0),
            SizedBox(height: 16.0),
            ContentPlaceholder(
              lineType: ContentLineType.twoLines,
            ),
          ],
        ),
      ),
    );
  }

  void _doLogout() async {
    try {
      showLoading();
      await _authStore.logout();
      dismissLoading();
      context.router.replaceAll([const LoginRoute()]);
    } catch (e) {
      showError(e);
    }
  }
}
