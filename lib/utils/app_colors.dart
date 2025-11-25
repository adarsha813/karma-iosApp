import 'package:flutter/material.dart';

class AppColors {
  // =====================
  // DARK MODE
  // =====================
  // Backgrounds
  static const Color background = Color(0xFF0D1117); // Main background
  static const Color surface = Color(0xFF161B22); // Cards, panels
  static const Color overlay = Color(0x990F141A); // 60% transparent overlay

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
  static const Color userBubble = Color(0xFF1F2A37); // User message
  static const Color aiBubble = Color(0xFF273447); // AI / Astrologer
  static const Color adviceBubble = Color(0xFF3B2F1F); // Advice / Insights
  static const Color clarificationBubble = Color(
    0xFF1D242C,
  ); // Clarification / Follow-up

  // Accents
  static const Color accentIndigo = Color(0xFF7B8AB8);
  static const Color accentTeal = Color(0xFF7CCFD4);

  // Borders
  static const Color borderStrong = Color(0xFF2A313A);
  static const Color borderSoft = Color(0xFF1C2229);

  // Buttons
  static const Color primaryButtonBackground = primaryGold;
  static const Color primaryButtonText = background;
  static const Color secondaryButtonBorder = primaryGold;
  static const Color ghostButtonText = textSecondary;

  // =====================
  // LIGHT MODE
  // =====================
  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8F9FB); // App background
  static const Color surfaceLight = Color(0xFFFFFFFF); // Cards, panels
  static const Color lowContrastPanel = Color(0xFFF1F3F5); // Panels / overlays

  // Brand Colors
  static const Color primaryGoldLight = Color(0xFFC49F53);
  static const Color goldLightLight = Color(0xFFEAD9A6);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textMutedLight = Color(0xFF64748B);

  // Chat Bubbles
  static const Color userBubbleLightMode = Color(0xFFE7ECF3);
  static const Color aiBubbleLightMode = Color(0xFFF1F4FA);
  static const Color adviceBubbleLightMode = Color(0xFFFFF7E6);
  static const Color clarificationBubbleLightMode = Color(0xFFEEF1F5);

  // Accents
  static const Color accentIndigoLight = Color(0xFF7B8AB8);
  static const Color accentTealLight = Color(0xFF7CCFD4);

  // Borders
  static const Color borderStrongLight = Color(0xFFCBD5E1);
  static const Color borderSoftLight = Color(0xFFF1F3F5);

  // Buttons
  static const Color primaryButtonBackgroundLight = primaryGoldLight;
  static const Color primaryButtonTextLight = textPrimaryLight;
  static const Color secondaryButtonBorderLight = primaryGoldLight;
  static const Color ghostButtonTextLight = textSecondaryLight;
}
