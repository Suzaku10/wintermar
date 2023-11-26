import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wintermar/domain/constant/app_sizes.dart';
import 'package:wintermar/presentation/components/app_button.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';
import 'package:wintermar/utilities/utilities.dart';

class ResendCodeWidgets extends StatefulWidget {
  const ResendCodeWidgets({super.key});

  @override
  State<ResendCodeWidgets> createState() => _ResendCodeWidgetsState();
}

class _ResendCodeWidgetsState extends State<ResendCodeWidgets> {
  Timer? timer;
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _resetTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('(${remainingTime(timeInSecond: _remainingTime)})'),
        AppButton.text(
          title: I10n.current.resend_code,
          onPressed: _resetTimer,
          enabled: _remainingTime == 0,
        )
      ],
    );
  }

  void _resetTimer() {
    if (timer?.isActive == true) return;
    _remainingTime = defaultTimer;

    /// TODO: Mock API Request using future delayed before set timer
    Future.delayed(const Duration(seconds: 1)).then((value) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_remainingTime >= 0) {
          setState(() {
            _remainingTime > 0 ? _remainingTime-- : timer?.cancel();
          });
        }
      });
    });
  }
}
