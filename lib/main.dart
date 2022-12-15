import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/constants/theme.dart';
import 'package:getx_state_management/bloc/theme_controller.dart';
import 'package:getx_state_management/di/injection.dart';
import 'package:getx_state_management/presentation/custom_sdui_widged.dart';
import 'package:getx_state_management/presentation/home_page.dart';
import 'package:injectable/injectable.dart';
import 'package:sdui/sdui.dart';


void main() async {
  await GetStorage.init();
  await configureDependencies();
  SDUIWidgetRegistry.getInstance().register('CustomSduiWidget', () => CustomSduiWidget());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: themeController.theme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: HomePage(title: 'Getx StateManagement'),
    );
  }
}
