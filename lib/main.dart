// import 'dart:convert';

// import 'package:adwaita/adwaita.dart';
// import 'package:collection/collection.dart';
// import 'package:provider/provider.dart';
// import 'package:signal_flutter/App.dart';
// // import 'package:signal_flutter/pages/StatisticPage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:signal_flutter/store/CentrifugeContext.dart';

// Future<void> main(List<String> args) async {
//   if (args.firstOrNull == 'multi_window') {
//     // final windowId = int.parse(args[1]);
//     final argument = args[2].isEmpty
//         ? <String, dynamic>{}
//         : jsonDecode(args[2]) as Map<String, dynamic>;
//     // switch (argument['name']) {
//     //   case 'flap':
//     //     runApp(DashboardPage());
//     //     break;
//     // }
//   } else {
//     runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (_) => CentrifugeContext(),
//             // child: FutureProvider<String>(
//             //   create: (context) => CentrifugeContext().listenWeight(),
//             //   // this will be displayed in the meantime
//             //   // until a new value is provided from the future
//             //   initialData: "fetching address...",
//             //   // child: MyApp(),
//             // ),
//           ),
//         ],
//         child: App(),
//       ),
//     );
//     // runApp(DashboardPage());
//   }
// }

// class App extends StatelessWidget {
//   App({Key? key}) : super(key: key);

//   final ValueNotifier<ThemeMode> themeNotifier =
//       ValueNotifier(ThemeMode.system);

//   @override
//   Widget build(BuildContext context) {
//     // context.read<CentrifugeContext>().listenWeight();
//     return ValueListenableBuilder<ThemeMode>(
//       valueListenable: themeNotifier,
//       builder: (_, ThemeMode currentMode, __) {
//         return MaterialApp(
//           theme: AdwaitaThemeData.light(),
//           darkTheme: AdwaitaThemeData.dark(),
//           debugShowCheckedModeBanner: false,
//           home: App(),
//           title: 'Signall Client',
//           themeMode: currentMode,
//         );
//       },
//     );
//   }
// }

// //  MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(create: (_) => Counter()),
// //       ],
// //       child: const MyApp(),
// //     ),

import 'dart:convert';

import 'package:adwaita/adwaita.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
import 'package:signal_flutter/App.dart';
import 'package:signal_flutter/pages/DashboardPage.dart';
// import 'package:signal_flutter/pages/StatisticPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signal_flutter/store/CentrifugeContext.dart';

Future<void> main(List<String> args) async {
  if (args.firstOrNull == 'multi_window') {
    // final windowId = int.parse(args[1]);
    final argument = args[2].isEmpty
        ? <String, dynamic>{}
        : jsonDecode(args[2]) as Map<String, dynamic>;
    // switch (argument['name']) {
    //   case 'flap':
    //     runApp(DashboardPage());
    //     break;
    // }
  } else {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CentrifugeContext(),
            // child: FutureProvider<String>(
            //   create: (context) => CentrifugeContext().listenWeight(),
            //   // this will be displayed in the meantime
            //   // until a new value is provided from the future
            //   initialData: "fetching address...",
            //   // child: MyApp(),
            // ),
          ),
        ],
        child: MainApp(),
      ),
    );
    // runApp(DashboardPage());
  }
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    // context.read<CentrifugeContext>().listenWeight();
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          theme: AdwaitaThemeData.light(),
          darkTheme: AdwaitaThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: App(),
          title: 'Signall Client',
          themeMode: currentMode,
        );
      },
    );
  }
}
