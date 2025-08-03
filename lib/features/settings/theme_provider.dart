import 'package:flutter/material.dart';
import 'package:surf_places/uikit/themes/app_theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  ThemeData get theme => _isDark ? AppThemeData.darkTheme : AppThemeData.lightTheme;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
