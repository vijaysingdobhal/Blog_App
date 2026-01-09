import 'package:blogapp/Core/Theme/AppPallet.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static _border([Color color = AppPallet.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 3,
  ),
  borderRadius: BorderRadius.circular(15),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallet.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallet.backgroundColor,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      contentPadding: const EdgeInsets.all(15),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallet.gradient2),
      border: _border(),
    ),
  );
}