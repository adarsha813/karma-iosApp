import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // =====================
  // TYPOGRAPHY SYSTEM (NEW)
  // =====================
  static const String _fontFamilyInter = 'Inter';
  static const String _fontFamilyPlayfair = 'PlayfairDisplay';

  static const TextTheme _baseTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
  );

  // =====================
  // BASE THEME CONFIGURATION (NEW)
  // =====================
  // =====================
  // BASE THEME CONFIGURATION
  // =====================
  static ThemeData _baseTheme({required bool isDark}) {
    return ThemeData(
      useMaterial3: true, // CHANGED to true for Material 3
      brightness: isDark ? Brightness.dark : Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      applyElevationOverlayColor: true,
    );
  }

  // =====================
  // COMPONENT THEMES (UPDATED FOR MATERIAL 3)
  // =====================

  // FIXED: For Material 3, use CardThemeData
  static CardThemeData _cardTheme(bool isDark) => CardThemeData(
    color: isDark ? AppColors.surface : AppColors.surfaceLight,
    elevation: 2,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  // FIXED: For Material 3, use DialogThemeData
  static DialogThemeData _dialogTheme(bool isDark) => DialogThemeData(
    backgroundColor: isDark ? AppColors.surface : AppColors.surfaceLight,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 8,
    titleTextStyle: TextStyle(
      fontFamily: _fontFamilyPlayfair,
      fontWeight: FontWeight.bold,
      color: isDark ? AppColors.textPrimary : AppColors.textPrimaryLight,
      fontSize: 20,
    ),
    contentTextStyle: TextStyle(
      fontFamily: _fontFamilyInter,
      color: isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
      fontSize: 16,
    ),
  );

  // =====================
  // COLOR SCHEME BUILDERS (NEW)
  // =====================
  static ColorScheme get _darkColors => const ColorScheme.dark(
    primary: AppColors.primaryGold,
    secondary: AppColors.accentTeal,
    surface: AppColors.surface,
    onPrimary: AppColors.background,
    onSecondary: AppColors.background,
    onSurface: AppColors.textPrimary,
    error: AppColors.error,
    onError: Colors.white,
    surfaceContainerHighest: AppColors.surface, // NEW
    outline: AppColors.borderSoft, // NEW
  );

  static ColorScheme get _lightColors => const ColorScheme.light(
    primary: AppColors.primaryGoldLight,
    secondary: AppColors.accentTealLight,
    surface: AppColors.surfaceLight,
    onPrimary: AppColors.textPrimaryLight,
    onSecondary: Colors.white,
    onSurface: AppColors.textPrimaryLight,
    error: AppColors.errorLight,
    onError: Colors.white,
    surfaceContainerHighest: AppColors.lowContrastPanel, // NEW
    outline: AppColors.borderSoftLight, // NEW
  );

  // =====================
  // TEXT THEME BUILDERS (NEW)
  // =====================
  static TextTheme _darkTextTheme(TextTheme base) => base.copyWith(
    displayLarge: base.displayLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimary,
    ),
    displayMedium: base.displayMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimary,
    ),
    displaySmall: base.displaySmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimary,
    ),
    headlineMedium: base.headlineMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimary,
    ),
    headlineSmall: base.headlineSmall!.copyWith(
      fontFamily: _fontFamilyPlayfair,
      color: AppColors.primaryGold,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimary,
    ),
    titleMedium: base.titleMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimary,
    ),
    titleSmall: base.titleSmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textSecondary,
    ),
    bodyLarge: base.bodyLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimary,
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textSecondary,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textMuted,
    ),
    labelLarge: base.labelLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.background,
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textSecondary,
    ),
    labelSmall: base.labelSmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textMuted,
    ),
  );

  static TextTheme _lightTextTheme(TextTheme base) => base.copyWith(
    displayLarge: base.displayLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimaryLight,
    ),
    displayMedium: base.displayMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimaryLight,
    ),
    displaySmall: base.displaySmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimaryLight,
    ),
    headlineMedium: base.headlineMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimaryLight,
    ),
    headlineSmall: base.headlineSmall!.copyWith(
      fontFamily: _fontFamilyPlayfair,
      color: AppColors.primaryGoldLight,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimaryLight,
    ),
    titleMedium: base.titleMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimaryLight,
    ),
    titleSmall: base.titleSmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textSecondaryLight,
    ),
    bodyLarge: base.bodyLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textPrimaryLight,
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textSecondaryLight,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textMutedLight,
    ),
    labelLarge: base.labelLarge!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.primaryGoldLight,
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textSecondaryLight,
    ),
    labelSmall: base.labelSmall!.copyWith(
      fontFamily: _fontFamilyInter,
      color: AppColors.textMutedLight,
    ),
  );

  // =====================
  // BUTTON STYLES (ENHANCED)
  // =====================
  static ElevatedButtonThemeData _elevatedButtonTheme(bool isDark) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isDark ? AppColors.primaryGold : AppColors.primaryGoldLight,
          foregroundColor:
              isDark ? AppColors.background : AppColors.textPrimaryLight,
          textStyle: const TextStyle(
            fontFamily: _fontFamilyInter,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ), // Enhanced padding
          elevation: 2,
          shadowColor: isDark ? Colors.black54 : Colors.black12,
          minimumSize: const Size(64, 48), // NEW: Minimum touch target
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonTheme(bool isDark) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor:
              isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
          side: BorderSide(
            color: isDark ? AppColors.goldLight : AppColors.primaryGoldLight,
            width: 1.5, // Enhanced border width
          ),
          textStyle: const TextStyle(
            fontFamily: _fontFamilyInter,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          minimumSize: const Size(64, 48), // NEW
        ),
      );

  static TextButtonThemeData _textButtonTheme(bool isDark) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor:
              isDark ? AppColors.primaryGold : AppColors.primaryGoldLight,
          textStyle: const TextStyle(
            fontFamily: _fontFamilyInter,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size(64, 48), // NEW
        ),
      );

  // =====================
  // COMPONENT THEMES (ENHANCED)
  // =====================
  static AppBarTheme _appBarTheme(bool isDark) => AppBarTheme(
    backgroundColor: isDark ? AppColors.surface : AppColors.surfaceLight,
    foregroundColor:
        isDark ? AppColors.primaryGold : AppColors.primaryGoldLight,
    elevation: 1, // Slight elevation for depth
    centerTitle: true,
    surfaceTintColor: Colors.transparent, // NEW: Material 3
    titleTextStyle: TextStyle(
      fontFamily: _fontFamilyPlayfair,
      fontWeight: FontWeight.bold,
      color: isDark ? AppColors.primaryGold : AppColors.primaryGoldLight,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: isDark ? AppColors.primaryGold : AppColors.primaryGoldLight,
    ),
  );

  static InputDecorationTheme _inputDecorationTheme(
    bool isDark,
  ) => InputDecorationTheme(
    filled: true,
    fillColor: isDark ? AppColors.surface : AppColors.lowContrastPanel,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: isDark ? AppColors.borderSoft : AppColors.borderSoftLight,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: isDark ? AppColors.borderSoft : AppColors.borderSoftLight,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: isDark ? AppColors.primaryGold : AppColors.primaryGoldLight,
        width: 2, // Enhanced focus border
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.error, width: 2),
    ),
    labelStyle: TextStyle(
      color: isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
    ),
    hintStyle: TextStyle(
      color: isDark ? AppColors.textMuted : AppColors.textMutedLight,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );

  // =====================
  // FINAL THEMES
  // =====================
  static final ThemeData darkTheme = _baseTheme(isDark: true).copyWith(
    colorScheme: _darkColors,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: _darkTextTheme(_baseTextTheme),
    elevatedButtonTheme: _elevatedButtonTheme(true),
    outlinedButtonTheme: _outlinedButtonTheme(true),
    textButtonTheme: _textButtonTheme(true),
    appBarTheme: _appBarTheme(true),
    iconTheme: const IconThemeData(color: AppColors.primaryGold),
    dividerTheme: const DividerThemeData(
      color: AppColors.borderSoft,
      thickness: 1,
      space: 1,
    ),
    cardTheme: _cardTheme(true),
    inputDecorationTheme: _inputDecorationTheme(true),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primaryGold,
      unselectedItemColor: AppColors.textSecondary,
      elevation: 4, // NEW
    ),
    dialogTheme: _dialogTheme(true),
    // NEW: Additional themes
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryGold,
      foregroundColor: AppColors.background,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
  );

  static final ThemeData lightTheme = _baseTheme(isDark: false).copyWith(
    colorScheme: _lightColors,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: _lightTextTheme(_baseTextTheme),
    elevatedButtonTheme: _elevatedButtonTheme(false),
    outlinedButtonTheme: _outlinedButtonTheme(false),
    textButtonTheme: _textButtonTheme(false),
    appBarTheme: _appBarTheme(false),
    iconTheme: const IconThemeData(color: AppColors.primaryGoldLight),
    dividerTheme: const DividerThemeData(
      color: AppColors.borderSoftLight,
      thickness: 1,
      space: 1,
    ),
    cardTheme: _cardTheme(false),
    inputDecorationTheme: _inputDecorationTheme(false),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceLight,
      selectedItemColor: AppColors.primaryGoldLight,
      unselectedItemColor: AppColors.textSecondaryLight,
      elevation: 2,
    ),
    dialogTheme: _dialogTheme(false),
    // NEW: Additional themes
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryGoldLight,
      foregroundColor: AppColors.textPrimaryLight,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.surfaceLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
  );
}
