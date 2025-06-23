import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Vibrant Food Palette
  static const Color primaryOrange = Color(0xFFFF6B35); // Vibrant orange - main brand color
  static const Color secondaryOrange = Color(0xFFFF8A50); // Lighter orange for accents
  static const Color accentOrange = Color(0xFFFFE8D6); // Very light orange for backgrounds
  
  // Fresh Greens - Vegetables & Herbs
  static const Color freshGreen = Color(0xFF4CAF50); // Fresh spinach green
  static const Color mintGreen = Color(0xFF81C784); // Mint green
  static const Color sageGreen = Color(0xFF9CCC65); // Sage green
  static const Color lightMint = Color(0xFFE8F5E8); // Very light mint
  
  // Rich Purples - Berries & Fruits
  static const Color berryPurple = Color(0xFF9C27B0); // Berry purple
  static const Color grapePurple = Color(0xFFBA68C8); // Grape purple
  static const Color lightBerry = Color(0xFFF3E5F5); // Light berry
  
  // Warm Reds - Tomatoes & Spices
  static const Color tomatoRed = Color(0xFFE53935); // Tomato red
  static const Color spiceRed = Color(0xFFFF7043); // Spice red
  static const Color lightTomato = Color(0xFFFFEBEE); // Light tomato
  
  // Golden Yellows - Grains & Spices
  static const Color goldenYellow = Color(0xFFFFB300); // Golden yellow
  static const Color turmericYellow = Color(0xFFFFCC02); // Turmeric yellow
  static const Color lightGolden = Color(0xFFFFF8E1); // Light golden
  
  // Creamy Whites & Beiges
  static const Color creamWhite = Color(0xFFFEFEFE); // Pure cream white
  static const Color warmBeige = Color(0xFFF5F1E8); // Warm beige
  static const Color latteBeige = Color(0xFFE8E0D0); // Latte beige
  
  // Deep Browns - Coffee & Chocolate
  static const Color coffeeBrown = Color(0xFF5D4037); // Coffee brown
  static const Color chocolateBrown = Color(0xFF8D6E63); // Chocolate brown
  static const Color lightCoffee = Color(0xFFEFEBE9); // Light coffee
  
  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF2C2C2C);
  static const Color darkGrey = Color(0xFF4A4A4A);
  static const Color mediumGrey = Color(0xFF8A8A8A);
  static const Color lightGrey = Color(0xFFE5E5E5);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFB300);
  static const Color info = Color(0xFF2196F3);
  
  // Background Colors
  static const Color background = Color(0xFFFEFEFE);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surfaceBackground = Color(0xFFF5F1E8);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryOrange, secondaryOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient foodGradient = LinearGradient(
    colors: [freshGreen, mintGreen, sageGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient berryGradient = LinearGradient(
    colors: [berryPurple, grapePurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient warmGradient = LinearGradient(
    colors: [tomatoRed, spiceRed, goldenYellow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
} 