
import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'my_app.dart';
import 'core/utils/app_logger_util.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLoggerUtil.d('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLoggerUtil.d('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  await runZonedGuarded(
    () async {
      HydratedBloc.storage = storage;
      Bloc.observer = AppBlocObserver();
      runApp(
        EasyLocalization(
          path: "assets/languages",
          supportedLocales: const [
            Locale("uz", "UZ"),
            Locale("ru", "RU"),
            Locale("en", "EN"),
          ],
          fallbackLocale: const Locale("en", "EN"),
          child: ModularApp(
            module: AppModule(),
            child: const MyApp(),
          ),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );

}


