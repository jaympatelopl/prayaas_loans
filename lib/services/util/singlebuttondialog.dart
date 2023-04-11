import 'package:flutter/material.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        String okBtnText = "OK"}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title,style: const TextStyle(fontSize: 16,color: Colors.black),),
            actions: <Widget>[
              ElevatedButton(
                child: Text(okBtnText),
                onPressed: () => Navigator.pop(context),
              )

            ],
          );
        });
  }
}


//showDialog(context: context, builder: (BuildContext context) => errorDialog);}