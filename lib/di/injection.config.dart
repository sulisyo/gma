// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/count_bloc.dart' as _i3;
import '../bloc/theme_controller.dart' as _i4;
import '../bloc/user_bloc.dart' as _i5;
import 'app_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.CountBloc>(_i3.CountBloc());
  await gh.factoryAsync<_i4.ThemeController>(
    () => appModule.themeController,
    preResolve: true,
  );
  gh.singleton<_i5.UserBloc>(_i5.UserBloc());
  return get;
}

class _$AppModule extends _i6.AppModule {}