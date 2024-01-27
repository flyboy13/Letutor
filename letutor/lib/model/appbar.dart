import 'package:flutter/material.dart';
import 'package:letutor/provider/active_theme_provider.dart';
import 'package:letutor/provider/theme_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget appbar() => AppBar(
      title: Row(children: [
        // SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Image.asset(
          "assets/Let_logo.png",
          height: 19,

          // width: MediaQuery.of(context).size.width * 0.1,
          alignment: Alignment.centerLeft,

          // Adjust the logo width as needed
        ),
      ]),
      actions: [
        Row(
          children: [
            Consumer(
              builder: (context, ref, child) => Icon(
                ref.watch(activeThemeProvider) == Themes.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
            const SizedBox(width: 8),
            const ThemeSwitch(),
          ],
        )
      ],
    );
