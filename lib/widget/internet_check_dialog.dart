import 'package:flutter/material.dart';
import 'package:prayaas_loans/services/util/showcustomesnackbar.dart';
import 'package:prayaas_loans/services/util/tg_net_util.dart';

void showSnackBarForInternetConnection(BuildContext context, Future<void> Function() apicall) async {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("Retry"),
    onPressed: () async {
      if (await TGNetUtil.isInternetAvailable()) {
        if (context.mounted) {
          showSnackBar(context, "You are online now");
          Navigator.of(context).pop(false);
        }
        apicall();
      } else {
        if (context.mounted) {
          showSnackBar(context, "You are offline");
        }
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Connectivity"),
    content: const Text("You are Offline.Please Turn on internet"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
          child: alert,
          onWillPop: () async {
            return false;
          });
    },
  );
}
