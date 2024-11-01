import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/res/routes/routes.dart';

import 'res/localization/languages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Demo',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
