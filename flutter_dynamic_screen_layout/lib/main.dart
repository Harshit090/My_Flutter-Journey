import 'package:flutter/material.dart';
import 'package:flutter_dynamic_screen_layout/responsive/desktop_sacffold.dart';
import 'package:flutter_dynamic_screen_layout/responsive/mobile_sacffold.dart';
import 'package:flutter_dynamic_screen_layout/responsive/responsive_layout.dart';
import 'package:flutter_dynamic_screen_layout/responsive/tablet_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
          mobileScaffold: const MobileScaffold(),
          tabletScaffold: const TabletScaffold(),
          desktopScaffold: const DesktopScaffold()),
    );
  }
}
