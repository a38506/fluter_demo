import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temp_project/theme/custom_theme_data.dart';
import 'package:temp_project/theme/dynamic_theme_widget.dart';
import 'application.dart';

void main() => runApp(const MyPreviewApp());

/// Khung preview mô phỏng điện thoại (cho desktop)
class MyPreviewApp extends StatelessWidget {
  const MyPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          color: Colors.grey[200],
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 390, // iPhone 13 width
              maxHeight: 844, // iPhone 13 height
            ),
            child: AspectRatio(
              aspectRatio: 390 / 844,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: const MyApp(), // 👈 Dùng lại app gốc
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicThemeWidget(
      customThemeData: CustomThemeData.light(),
      initThemeData: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black87,
          secondary: Colors.redAccent,
        ),
        textTheme: GoogleFonts.quicksandTextTheme(),
        primaryTextTheme: GoogleFonts.quicksandTextTheme(),
        tabBarTheme: TabBarThemeData(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.redAccent, width: 4),
          ),
          labelColor: Colors.black87,
          labelStyle: GoogleFonts.quicksand(
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
          unselectedLabelColor: Colors.black54,
          unselectedLabelStyle: GoogleFonts.quicksand(
            color: Colors.black54,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
      initLocale: const Locale('vi', 'VN'),
      child: const Application(),
    );
  }
}
