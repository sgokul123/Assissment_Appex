import 'package:appex_assignment/src/localisation/generated/locale_base.dart';
import 'package:flutter/widgets.dart';

class LocalesString {
  LocaleMain localizations;
  static LocalesString _inst;

  LocalesString._internal(BuildContext context) {
    localizations = Localizations.of<LocaleBase>(context, LocaleBase).main;
  }

  factory LocalesString(BuildContext context) {
    if (_inst == null) {
      _inst = new LocalesString._internal(context);
    }
    return _inst;
  }
}
