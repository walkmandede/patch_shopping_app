import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "SFPro",
    primaryColor: const Color(0xff7A6EAE), // Updated to a soft blue from the image
    scaffoldBackgroundColor: const Color(0xFFF7F9FF), // Light grayish background
    colorScheme: const ColorScheme.light(
      primary: Color(0xff7A6EAE), // Soft blue as primary color
      secondary: Color(0xFF4F8C94), // Screen background
      surface: Color(0xFFFFFFFF), // White card background
      error: Colors.red, // Error color remains red
      onPrimary: Colors.white, // Text on primary
      onSecondary: Colors.white, // Text on background
      onSurface: Color(0xFF333333), // Text on surface
      onError: Colors.white, // Text on error
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
      bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFF333333)),
      bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xFF555555)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff7A6EAE),
      foregroundColor: Colors.white,
      elevation: 4.0,
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      toolbarTextStyle: TextStyle(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff7A6EAE),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: const Color(0xff7A6EAE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF4F8C94)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff7A6EAE)),
      ),
      hintStyle: TextStyle(color: Colors.grey),
    ),
    dividerColor: Colors.grey[300],
    cardColor: Colors.white,
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0xff7A6EAE),
      deleteIconColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.all(4.0),
      shape: StadiumBorder(),
      secondaryLabelStyle: TextStyle(color: Colors.white),
      secondarySelectedColor: Color(0xFF4F8C94),
      selectedColor: Color(0xFF4F8C94),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF4F8C94),
      size: 24,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: Color(0xff7A6EAE),
      labelColor: Color(0xff7A6EAE),
      unselectedLabelColor: Colors.grey,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Color(0xFF333333)),
      contentTextStyle: TextStyle(color: Color(0xFF333333)),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) { return null; }
        if (states.contains(WidgetState.selected)) { return const Color(0xff7A6EAE); }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) { return null; }
        if (states.contains(WidgetState.selected)) { return const Color(0xff7A6EAE); }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) { return null; }
        if (states.contains(WidgetState.selected)) { return const Color(0xff7A6EAE); }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) { return null; }
        if (states.contains(WidgetState.selected)) { return const Color(0xff7A6EAE); }
        return null;
      }),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "SFPro",
    primaryColor: const Color(0xff7A6EAE), // Dark blue as the primary color
    scaffoldBackgroundColor: const Color(0xFF191919), // Dark grey background
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff7A6EAE), // Dark blue as the primary color
      secondary: Color(0xFF9E9E9E), // Light grey for secondary elements
      surface: Color(0xFF222222), // Card background
      error: Colors.red, // Error color
      onPrimary: Colors.white, // Text on primary
      onSecondary: Colors.white, // Text on background
      onSurface: Color(0xFFDDDDDD), // Text on surface
      onError: Colors.white, // Text on error
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
      bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFFDDDDDD)), // Light grey text
      bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xFFBBBBBB)), // Subtle grey text
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF222222), // Dark grey for AppBar
      foregroundColor: Colors.white,
      elevation: 4.0,
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      toolbarTextStyle: TextStyle(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF0A47A6), // Dark blue for buttons
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF0A47A6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF9E9E9E)), // Light grey
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0A47A6)), // Dark blue when focused
      ),
      hintStyle: TextStyle(color: Colors.grey[600]),
    ),
    dividerColor: Colors.grey[800], // Subtle dividers
    cardColor: const Color(0xFF222222), // Dark grey for cards
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0xFF0A47A6), // Dark blue chips
      deleteIconColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.all(4.0),
      shape: StadiumBorder(),
      secondaryLabelStyle: TextStyle(color: Colors.white),
      secondarySelectedColor: Color(0xFF9E9E9E),
      selectedColor: Color(0xFF9E9E9E), // Selected chips in light grey
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF0A47A6), // Dark blue for icons
      size: 24,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: Color(0xFF0A47A6), // Dark blue indicator
      labelColor: Color(0xFF0A47A6), // Dark blue label
      unselectedLabelColor: Colors.grey, // Grey for unselected
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF222222), // Card background
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF222222), // Dialog background
      titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)), // White for titles
      contentTextStyle: TextStyle(color: Color(0xFFDDDDDD)), // Light grey text
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return null;
        if (states.contains(MaterialState.selected)) return const Color(0xFF0A47A6); // Dark blue when checked
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return null;
        if (states.contains(MaterialState.selected)) return const Color(0xFF0A47A6); // Dark blue when selected
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return null;
        if (states.contains(MaterialState.selected)) return const Color(0xFF0A47A6); // Dark blue for the thumb
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return null;
        if (states.contains(MaterialState.selected)) return const Color(0xFF0A47A6); // Dark blue for the track
        return null;
      }),
    ),
  );

}
