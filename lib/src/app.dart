import 'package:appex_assignment/src/controller/home_screen_controller.dart';
import 'package:appex_assignment/src/controller/login_screen_controller.dart';
import 'package:appex_assignment/src/localisation/locale_delegate.dart';
import 'package:appex_assignment/src/ui/home_screen.dart';
import 'package:appex_assignment/src/ui/login_screen.dart';
import 'package:appex_assignment/src/utils/shared_preference_keys.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
  bool isLoggedIn = false;

  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('hi', 'IN'), // Hindi India
        const Locale.fromSubtags(countryCode: 'IN'), // Hindi India
      ],
      localizationsDelegates: [
        const LocDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
      home: isLoggedIn ? HomeSceen() : LoginScreen(),
    );
  }

  Future<void> checkUserLoggedIn() async {
    Get.put(LoginScreenController());
    Get.put(HomeScreenController());
    String _username = await encryptedSharedPreferences
        .getString(SharedPreferenceKeys.IS_LOGGED_IN);
    if (_username != null && _username.isNotEmpty && _username == "true") {
      setState(() {
        isLoggedIn = true;
      });
    }
  }
}
