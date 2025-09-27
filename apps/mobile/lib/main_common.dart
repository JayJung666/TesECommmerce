import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:atlantis_core/atlantis_core.dart';

import 'src/app.dart';
import 'src/core/app_config.dart';

enum AppFlavor { dev, staging, prod }

void mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure app based on flavor
  AppConfig.initialize(flavor);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Firebase (would be done here)
  // await Firebase.initializeApp();

  runApp(
    ProviderScope(
      observers: [
        if (AppConfig.isDev) AppProviderObserver(),
      ],
      child: const AtlantisApp(),
    ),
  );
}

class AppProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint(
      '[PROVIDER] ${provider.name ?? provider.runtimeType}: '
      '$previousValue -> $newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    debugPrint(
      '[PROVIDER ERROR] ${provider.name ?? provider.runtimeType}: $error',
    );
  }
}