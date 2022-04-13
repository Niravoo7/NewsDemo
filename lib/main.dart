import 'package:demo_news/presentation/constants/themes/theme_service.dart';
import 'package:demo_news/presentation/constants/themes/themes.dart';
import 'package:demo_news/routes/app_pages.dart';
import 'package:demo_news/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'helper/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.hiveName);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppRoutes.newsPage,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.downToUp,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        title: AppConstants.appName,
        getPages: AppPages.list);
  }
}
