import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transfert/core/theme/app_colors.dart';

class AppTypography {
  static TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      color: AppColors.textSecondary,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColors.textSecondary,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
  );
}