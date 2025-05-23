import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFFCFCFC);
  static const foreground = Color(0xFF0A0A0A);

  static const card = Color(0xFFFFFFFF);
  static const cardForeground = Color(0xFF0A0A0A);

  static const primary = Color(0xFF4F46E5); // Indigo 600
  static const primaryForeground = Color(0xFFFFFFFF);

  static const secondary = Color(0xFFF3F4F6);
  static const secondaryForeground = Color(0xFF1F2937);

  static const muted = Color(0xFFE5E7EB);
  static const mutedForeground = Color(0xFF6B7280);

  static const destructive = Color(0xFFEF4444);
  static const destructiveForeground = Color(0xFFFFFFFF);

  static const border = Color(0xFFE5E7EB);
  static const input = Color(0xFFE5E7EB);
  static const ring = Color(0xFF4F46E5);

  static const sidebarBackground = Color(0xFFF9FAFB);
  static const sidebarForeground = Color(0xFF111827);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    cardColor: AppColors.card,
    shadowColor: Colors.black12,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.foreground),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.foreground,
      elevation: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        elevation: 2,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.input,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.border),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: AppColors.primary,
    cardColor: const Color(0xFF1E1E1E),
    shadowColor: Colors.black12,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.card),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: AppColors.card,
      elevation: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        elevation: 2,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFF2A2A2A),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.muted),
      ),
    ),
  );
}
