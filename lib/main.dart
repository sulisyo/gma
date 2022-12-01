import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/constants/theme.dart';
import 'package:getx_state_management/controllers/theme_controller.dart';
import 'package:getx_state_management/presentation/home_page.dart';
import 'package:provider/provider.dart';

import 'controllers/count_controller.dart';
import 'controllers/user_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => UserController()),
        ChangeNotifierProvider(
            create: (BuildContext context) => CountController())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: themeController.theme,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        home: HomePage(title: 'Provider StateManagement'),
      ),
    );
  }
}
