import 'package:flutter/material.dart';
import 'package:prayaas_loans/config/style_config.dart';

class FieldHeader extends StatelessWidget {
  const FieldHeader({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: StyleConfig.regularText16,
    );
  }
}
