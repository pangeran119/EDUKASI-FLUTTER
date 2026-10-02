import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryDark = Color(0xFF004D40); // Hijau Tua Edumabul
  static const Color primaryYellow = Color(0xFFFFC107); // Kuning Aksesori
  static const Color accentLight = Color(0xFFE0F2F1); // Hijau Muda/Mint Background
  static const Color background = Color(0xFFF8F9FA);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Sans-Serif',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primaryDark,
        secondary: AppColors.primaryYellow,
      ),
    );
  }
}