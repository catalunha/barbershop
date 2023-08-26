import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:flutter/material.dart';

sealed class AppTheme {
  static const OutlineInputBorder _defaultOutlineInputBorder =
      OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(color: AppConstantColors.grey),
  );
  static ThemeData themeData = ThemeData(
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppConstantColors.white,
        labelStyle: const TextStyle(color: AppConstantColors.grey),
        border: _defaultOutlineInputBorder,
        enabledBorder: _defaultOutlineInputBorder,
        errorBorder: _defaultOutlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: AppConstantColors.red,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: AppConstantColors.white,
            backgroundColor: AppConstantColors.brow,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      fontFamily: AppConstantFonts.fontFamily);
}
