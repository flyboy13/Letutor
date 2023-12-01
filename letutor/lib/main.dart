import 'package:flutter/material.dart';
import 'package:letutor/model/router.dart';
import 'package:letutor/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
          // ChangeNotifierProvider(
          //   create: (_) => NavigationIndex(),
          // ),
          // ChangeNotifierProvider(
          //   create: (_) => SettingProvider(),
          // )
        ],
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ));
    // return LessonScheduleApp();
  }
}
