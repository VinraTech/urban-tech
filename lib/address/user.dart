import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePref {
  static SharedPreferences? _preferences;

  static const total_price = "total_price";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTotalPrice(double userName) async =>
      await _preferences?.setDouble(total_price, userName);
  static double? getTotalPrice() => _preferences?.getDouble(total_price);

  static clearPref() async => await _preferences?.clear();
}
