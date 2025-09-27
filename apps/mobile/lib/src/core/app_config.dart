import '../../main_common.dart';

class AppConfig {
  static late AppFlavor _flavor;

  static void initialize(AppFlavor flavor) {
    _flavor = flavor;
  }

  static bool get isDev => _flavor == AppFlavor.dev;
  static bool get isStaging => _flavor == AppFlavor.staging;
  static bool get isProd => _flavor == AppFlavor.prod;

  static String get appName {
    switch (_flavor) {
      case AppFlavor.dev:
        return 'Atlantis Shop Dev';
      case AppFlavor.staging:
        return 'Atlantis Shop Staging';
      case AppFlavor.prod:
        return 'Atlantis Shop';
    }
  }

  static String get baseUrl {
    const envUrl = String.fromEnvironment('API_BASE_URL');
    if (envUrl.isNotEmpty) return envUrl;

    switch (_flavor) {
      case AppFlavor.dev:
        return 'https://api-dev.atlantisshop.com/v1';
      case AppFlavor.staging:
        return 'https://api-staging.atlantisshop.com/v1';
      case AppFlavor.prod:
        return 'https://api.atlantisshop.com/v1';
    }
  }

  static bool get enableLogging => isDev || isStaging;
}