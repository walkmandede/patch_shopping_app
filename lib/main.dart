import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:patch_shopping_app/core/common/app_functions.dart';
import 'package:patch_shopping_app/presentation/modules/home_page/home_page.dart';
import 'core/common/app_theme.dart';
import 'core/routes/route_utils.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  log("main is built");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("my app");
    return MaterialApp(
      key: GlobalKey(),
      routes: RouteUtils().routes,
      home: const GatewayPage(),
      debugShowCheckedModeBanner: false,
      title: 'Patch Shopping Application',
      locale: const Locale('en', 'EN'),
      theme: AppTheme.lightTheme, // Use the light theme
      darkTheme: AppTheme.darkTheme, // Use the dark theme
      themeMode: ThemeMode.system,
    );
  }
}

class GatewayPage extends StatefulWidget {
  const GatewayPage({super.key});

  @override
  State<GatewayPage> createState() => _GatewayPageState();
}

class _GatewayPageState extends State<GatewayPage> {
  @override
  void initState() {
    initLoad(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Entry Page"),
      ),
      body: Center(
        child: Text(
          "App initializing..."
              "\nPlease wait for a moment!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void initLoad(context) async {
    //todo
    //business logic before entering the app
    //like setting localizations, navigating to pages based on already being logged in or not
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteUtils.homePage,
        (route) => false,
      );
    } catch (_) {}
  }
}
