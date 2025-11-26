import 'package:flutter/material.dart';

class AppColors {
  // =====================
  // DARK MODE
  // =====================
  // Backgrounds
  static const Color background = Color(0xFF0D1117);
  static const Color surface = Color(0xFF161B22);
  static const Color overlay = Color(0x990F141A);

  // Brand Colors
  static const Color primaryGold = Color(0xFFD5B46F);
  static const Color goldDark = Color(0xFFA98A4F);
  static const Color goldLight = Color(0xFFE3C483);

  // Text Colors
  static const Color textPrimary = Color(0xFFE6EDF3);
  static const Color textSecondary = Color(0xFF9BA4B1);
  static const Color textMuted = Color(0xFF5C6673);
  static const Color textDisabled = Color(0xFF3C4450);

  // Chat Bubbles
  static const Color userBubble = Color(0xFF1E293B);
  static const Color aiBubble = Color(0xFF253247);
  static const Color adviceBubble = Color(0xFF3B2F1F);
  static const Color clarificationBubble = Color(0xFF1A2430);

  // Accents
  static const Color accentIndigo = Color(0xFF7B8AB8);
  static const Color accentTeal = Color(0xFF7CCFD4);

  // Borders
  static const Color borderStrong = Color(0xFF2A313A);
  static const Color borderSoft = Color(0xFF1C2229);

  // States
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // =====================
  // LIGHT MODE
  // =====================
  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8F9FB);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color lowContrastPanel = Color(0xFFF1F3F5);

  // Brand Colors
  static const Color primaryGoldLight = Color(0xFFC49F53);
  static const Color goldLightLight = Color(0xFFEAD9A6);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textMutedLight = Color(0xFF64748B);

  // Chat Bubbles
  static const Color userBubbleLightMode = Color(0xFFE8EEF8);
  static const Color aiBubbleLightMode = Color(0xFFF4F5F8);
  static const Color adviceBubbleLightMode = Color(0xFFFFF1D9);
  static const Color clarificationBubbleLightMode = Color(0xFFE3EBF7);

  // Accents
  static const Color accentIndigoLight = Color(0xFF7B8AB8);
  static const Color accentTealLight = Color(0xFF7CCFD4);

  // Borders
  static const Color borderStrongLight = Color(0xFFCBD5E1);
  static const Color borderSoftLight = Color(0xFFF1F3F5);

  // States
  static const Color successLight = Color(0xFF059669);
  static const Color warningLight = Color(0xFFD97706);
  static const Color errorLight = Color(0xFFDC2626);
  static const Color infoLight = Color(0xFF2563EB);

  // =====================
  // SEMANTIC GETTERS (NEW)
  // =====================
  static Color getSuccess(bool isDark) => isDark ? success : successLight;
  static Color getWarning(bool isDark) => isDark ? warning : warningLight;
  static Color getError(bool isDark) => isDark ? error : errorLight;
  static Color getInfo(bool isDark) => isDark ? info : infoLight;

  // =====================
  // GRADIENTS (NEW)
  // =====================
  static const LinearGradient goldGradient = LinearGradient(
    colors: [goldLight, primaryGold],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cosmicGradient = LinearGradient(
    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
