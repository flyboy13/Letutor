import 'package:flutter/material.dart';
import 'package:letutor/model/router.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MultiProvider(
        providers: const [
          // ChangeNotifierProvider(
          //   create: (_) => NavigationIndex(),
          // ),
          // ChangeNotifierProvider(
          //   create: (_) => SettingProvider(),
          // )
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            // enable Material 3
            useMaterial3: true,
            primarySwatch: Colors.indigo,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ));
    // return LessonScheduleApp();
  }
}
