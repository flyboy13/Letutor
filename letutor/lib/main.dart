import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/control/app.dart';
import 'package:letutor/database/data/storage.dart';
import 'package:letutor/model/router.dart';
import 'package:letutor/provider/navigation_index.dart';
import 'package:letutor/provider/setting.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.put<App>(App()).init();
  AppStorage appStorage = AppStorage();
  await appStorage.init();
  runApp(const MyApp());
}

class MyApp extends GetWidget<App> {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NavigationIndex(),
          ),
          ChangeNotifierProvider(
            create: (_) => SettingProvider(),
          )
        ],
        child: GetMaterialApp(
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
        ));

    // return LessonScheduleApp();
  }
}
