import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _kEmail = 'user_email';
  static const _kPassword = 'user_pass';

  Future<void> saveUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kEmail, email);
    await prefs.setString(_kPassword, password);
  }

  Future<bool> signIn(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_kEmail);
    final savedPassword = prefs.getString(_kPassword);
    if (savedEmail == null || savedPassword == null) return false;
    return savedEmail == email && savedPassword == password;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kEmail);
    await prefs.remove(_kPassword);
  }
}
