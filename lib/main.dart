import 'package:alarm/provider/clock_provider.dart';
import 'package:alarm/provider/theme_provider.dart';
import 'package:alarm/util/themes.dart';
import 'package:alarm/views/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await SharedPreferences.getInstance().then((pref) {
    final isDark = pref.getBool('isDark') ?? false;
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ClockProvider>(create: (_) => ClockProvider()),
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(
              isDark
                  ? themeOptions[ThemeOptions.Dark]
                  : themeOptions[ThemeOptions.Light],
            ),
          ),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: provider.themeData,
        home: NavigationScreen(),
      );
    });
  }
}
