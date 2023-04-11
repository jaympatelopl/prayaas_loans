import 'package:flutter/material.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';

enum Status {
  completed(AppString.completedStatus),
  pending(AppString.pendingStatus),
  rejected(AppString.rejectedStatus);

  const Status(this.value);

  final String value;
}

class AppCommonWidget {
  static LinearGradient linearGradientWidget() {
    return const LinearGradient(
      colors: [
        Color(0x8000B5EF),
        Color(0xFFffffff),
        // Color(0x1A00B5EF),
        // Color(0xFFffffff),
      ],
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.centerRight,
      stops: [0.0, 0.5],
      tileMode: TileMode.clamp,
    );
  }
}
