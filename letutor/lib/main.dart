import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:letutor/control/app.dart';
import 'package:letutor/database/data/storage.dart';
import 'package:letutor/model/router.dart';
import 'package:letutor/provider/active_theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final app = Get.put<App>(App()); // Initialize the App instance
  await app.init();
  AppStorage appStorage = AppStorage();
  await appStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ThemeData.dark().copyWith(
      canvasColor: const Color.fromARGB(255, 255, 255, 255),
      cardColor: const Color.fromARGB(255, 255, 255, 255),
      scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            brightness: Brightness.light,
            primaryContainer: const Color.fromARGB(255, 255, 255, 255),
            surfaceTint: const Color.fromARGB(255, 255, 255, 255),
            background: const Color.fromARGB(255, 255, 255, 255),
            onBackground: const Color.fromARGB(255, 255, 255, 255),
            primary: const Color.fromARGB(255, 61, 168, 255),
            onPrimary: const Color.fromARGB(255, 255, 255, 255),
            secondary: const Color.fromARGB(255, 255, 255, 255),
            onSecondary: const Color.fromARGB(255, 228, 228, 228),
          ),
      textTheme: ThemeData.dark().textTheme.apply(
            bodyColor:
                const Color.fromARGB(255, 0, 90, 207), // color for body text
            displayColor:
                const Color.fromARGB(255, 255, 255, 255), // color for headings
          ),
    );
    final activeTheme = ref.watch(activeThemeProvider);
    return GetMaterialApp(
      darkTheme: darkTheme,
      themeMode: activeTheme == Themes.light ? ThemeMode.dark : ThemeMode.light,
      title: 'Letutor',
      theme: ThemeData(
        // enable Material 3
        useMaterial3: true,
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: '/signin',
      useInheritedMediaQuery: true,
    );

    // return LessonScheduleApp();
  }
}
