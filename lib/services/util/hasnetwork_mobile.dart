import 'dart:io';
import 'package:http/http.dart' as http;

Future<bool> hasNetwork() async
{
  try {
    final result = await http.get(Uri.parse('www.google.com'));
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}