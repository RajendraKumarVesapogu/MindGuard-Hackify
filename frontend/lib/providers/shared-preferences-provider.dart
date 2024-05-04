import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesProvider {
  SharedPreferences? preferences;

  getPreferences() async {
    if (preferences != null) {
      return preferences;
    }
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }
}

