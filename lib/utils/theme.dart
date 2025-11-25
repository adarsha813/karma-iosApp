// app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryGold,
      secondary: AppColors.accentTeal,
      background: AppColors.background,
      surface: AppColors.surface,
      onPrimary: AppColors.background,
      onSecondary: AppColors.background,
      onBackground: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.primaryGold,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        color: AppColors.primaryGold,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryGold),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        color: AppColors.primaryGold,
        fontSize: 20,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textMuted,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.background,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textMuted,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGold,
        foregroundColor: AppColors.background,
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        side: const BorderSide(color: AppColors.goldLight),
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryGold,
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryGold),
    dividerTheme: const DividerThemeData(
      color: AppColors.borderSoft,
      thickness: 1,
      space: 1,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderSoft),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderSoft),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryGold),
      ),
      labelStyle: const TextStyle(color: AppColors.textSecondary),
      hintStyle: const TextStyle(color: AppColors.textMuted),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primaryGold,
      unselectedItemColor: AppColors.textSecondary,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: const TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        fontSize: 20,
      ),
      contentTextStyle: const TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 16,
      ),
    ),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryGoldLight,
      secondary: AppColors.accentTealLight,
      background: AppColors.backgroundLight,
      surface: AppColors.surfaceLight,
      onPrimary: AppColors.textPrimaryLight,
      onSecondary: Colors.white,
      onBackground: AppColors.textPrimaryLight,
      onSurface: AppColors.textPrimaryLight,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      foregroundColor: AppColors.primaryGoldLight,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        color: AppColors.primaryGoldLight,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryGoldLight),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimaryLight,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimaryLight,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimaryLight,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimaryLight,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        color: AppColors.primaryGoldLight,
        fontSize: 20,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimaryLight,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimaryLight,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondaryLight,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimaryLight,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondaryLight,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textMutedLight,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.primaryButtonTextLight,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondaryLight,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textMutedLight,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryButtonBackgroundLight,
        foregroundColor: AppColors.primaryButtonTextLight,
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.ghostButtonTextLight,
        side: const BorderSide(color: AppColors.secondaryButtonBorderLight),
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryGoldLight,
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryGoldLight),
    dividerTheme: const DividerThemeData(
      color: AppColors.borderSoftLight,
      thickness: 1,
      space: 1,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lowContrastPanel,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderSoftLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderSoftLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryGoldLight),
      ),
      labelStyle: const TextStyle(color: AppColors.textSecondaryLight),
      hintStyle: const TextStyle(color: AppColors.textMutedLight),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceLight,
      selectedItemColor: AppColors.primaryGoldLight,
      unselectedItemColor: AppColors.textSecondaryLight,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: const TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryLight,
        fontSize: 20,
      ),
      contentTextStyle: const TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondaryLight,
        fontSize: 16,
      ),
    ),
  );
}
