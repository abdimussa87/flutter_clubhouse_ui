import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';
import 'package:flutter_clubhouse_ui/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          title: 'Flutter Clubhouse UI',
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context), // Add the locale here
          builder: DevicePreview.appBuilder, // Add the builder here
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Palette.background),
            scaffoldBackgroundColor: Palette.background,
            primaryColor: Colors.white,
            accentColor: Palette.green,
            iconTheme: const IconThemeData(color: Colors.black),
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: GoogleFonts.montserratTextTheme(),
          ),
          home: HomeScreen(),
        );
      });
    });
  }
}
