import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUserNameFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userName');
}

Future<String?> getTokenFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<String?> getPictureFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('picture');
}

Future<String?> getEmailFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}
