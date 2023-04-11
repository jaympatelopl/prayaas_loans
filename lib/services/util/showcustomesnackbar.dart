import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    content: Text(msg),
    backgroundColor: Colors.black,
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: "",
      disabledTextColor: Colors.white,
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
