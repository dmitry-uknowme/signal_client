import 'package:adwaita/adwaita.dart';
import 'package:signal_flutter/pages/DashboardPage.dart';
import 'package:flutter/material.dart';

class FlapDemo extends StatelessWidget {
  FlapDemo({Key? key, ValueNotifier<ThemeMode>? themeNotifier})
      : super(key: key);

  final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          theme: AdwaitaThemeData.light(),
          darkTheme: AdwaitaThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: FlapHomePage(themeNotifier: themeNotifier),
          themeMode: currentMode,
        );
      },
    );
  }
}
