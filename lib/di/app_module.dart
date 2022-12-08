import 'package:getx_state_management/bloc/count_bloc.dart';
import 'package:injectable/injectable.dart';

import '../bloc/theme_controller.dart';

@module
abstract class AppModule {

  @preResolve
  Future<ThemeController> get themeController async => ThemeController();
}