import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class SecureSharePreferenceManager {
  static final  EncryptedSharedPreferences encryptedSharedPreferences = EncryptedSharedPreferences();

  static Future<bool> putString(String key, String value)  {
    return encryptedSharedPreferences.setString(key, value);
  }

  static Future<String> getString(String key)  {
    return  encryptedSharedPreferences.getString(key);
  }
}
