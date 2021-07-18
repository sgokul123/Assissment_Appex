import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;

  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }

  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  LocaleMain _main;

  LocaleMain get main => _main;

  void initAll() {
    _main = LocaleMain(Map<String, String>.from(_data['main']));
  }
}

class LocaleMain {
  final Map<String, String> _data;

  LocaleMain(this._data);

  String get password => _data["password"];

  String get userName => _data["user_name"];

  String get logoutScreen => _data["logout_screen"];

  String get leaveScreen => _data["leave_screen"];

  String get apexAssessment => _data["apex_assessment"];

  String get winningPercentage => _data["winning_percentage"];

  String get tournamentWon => _data["tournament_won"];

  String get tournamentPlayed => _data["tournament_played"];

  String get recommendadForYou => _data["recommended_for_you"];

  String get displayName => _data["display_name"];

  String get eloRating => _data["elo_rating"];

  String get flyingWolf => _data["flying_wolf"];

  String get userNameError => _data["user_name_error"];

  String get passwordError => _data["password_error"];

  String get login => _data["login"];

  String get passwordIncorrect => _data["password_incorrect"];

  String get userNotExist => _data["user_not_exist"];
}
