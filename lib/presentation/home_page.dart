import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_state_management/constants/theme.dart';
import 'package:getx_state_management/bloc/count_bloc.dart';
import 'package:getx_state_management/bloc/theme_controller.dart';
import 'package:getx_state_management/presentation/sdui_page.dart';
import 'package:getx_state_management/presentation/simple_home_page.dart';
import 'package:getx_state_management/presentation/user_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final themeController = GetIt.I<ThemeController>();
  final CountBloc countController = GetIt.I<CountBloc>();

  @override
  Widget build(BuildContext context) {
    //StreamSubscription subscription;
    //subscription = countController.stream.listen((state){});
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                themeController.changeTheme(Themes.lightTheme);
                themeController.saveTheme(false);
              } else {
                themeController.changeTheme(Themes.darkTheme);
                themeController.saveTheme(true);
              }
            },
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 40.0,
            ),
            StreamBuilder<CountState>(
              stream: countController.stream,
              builder: (context, snapShot) {
                return Text(
                  '${snapShot.data?.number}',
                  style: const TextStyle(fontSize: 48.0),
                );
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                  onPressed: () => countController
                      .add(const CountEvent(counter: Counter.decrement)),
                  tooltip: 'simpleDecrement',
                  label: const Text('Decrement'),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    countController
                        .add(const CountEvent(counter: Counter.increment));
                  },
                  tooltip: 'simpleIncrement',
                  label: const Text('Increment'),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => Get.to(SimpleHomePage()),
              child: const Text('Simple Home Page'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => Get.to(UserPage()),
              child: const Text('User Home Page'),
            ),
             ElevatedButton(
              onPressed: () => Get.to(SduiPage()),
              child: const Text('Sdui Page'),
            ),
          ],
        ),
      ),
    );
  }
}
