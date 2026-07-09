import 'package:flutter/material.dart';

enum SeniorityLevel { all, junior, intermediate, senior }

class FilterProvider extends ChangeNotifier {
  SeniorityLevel _level = SeniorityLevel.all;

  SeniorityLevel get level => _level;

  void setLevel(SeniorityLevel level) {
    _level = level;
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void toggleLocale() {
    _locale =
        _locale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    notifyListeners();
  }
}
