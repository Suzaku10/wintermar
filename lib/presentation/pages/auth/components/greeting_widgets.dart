import 'package:flutter/material.dart';
import 'package:wintermar/domain/constant/app_assets.dart';
import 'package:wintermar/domain/constant/app_text_styles.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: I10n.current.greetings,
                  children: [
                    TextSpan(text: I10n.current.welcome, style: AppStyles.displayLg.bold.primary),
                  ],
                ),
                style: AppStyles.displayLg.primary,
              ),
              Text(I10n.current.register_info, style: AppStyles.textXs.primary),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(AppAssets.imgOnBoard),
        )
      ],
    );
  }
}
