class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Atlantis Shop';
  static const String appVersion = '1.0.0';

  // API
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.atlantisshop.com/v1',
  );
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Image
  static const String placeholderImage = 'assets/images/placeholder.png';
  static const int imageQuality = 85;
  static const int maxImageSize = 1024;

  // Cache
  static const Duration cacheExpiration = Duration(hours: 1);
  static const Duration longCacheExpiration = Duration(days: 7);

  // Network
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration longNetworkTimeout = Duration(minutes: 2);
  static const int maxRetryAttempts = 3;

  // Database
  static const String databaseName = 'atlantis_shop.db';
  static const int databaseVersion = 1;

  // Shared Preferences Keys
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyIsFirstLaunch = 'is_first_launch';
  static const String keyCartItems = 'cart_items';
  static const String keyWishlistItems = 'wishlist_items';
  static const String keySearchHistory = 'search_history';

  // Secure Storage Keys
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String productsCollection = 'products';
  static const String categoriesCollection = 'categories';
  static const String ordersCollection = 'orders';
  static const String reviewsCollection = 'reviews';

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int maxNameLength = 50;
  static const int maxMessageLength = 500;

  // Currency
  static const String defaultCurrency = 'IDR';
  static const String defaultLocale = 'id_ID';

  // Payment
  static const String midtransClientKey = String.fromEnvironment(
    'MIDTRANS_CLIENT_KEY',
    defaultValue: '',
  );
  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: '',
  );

  // Deep Links
  static const String deepLinkScheme = 'atlantisshop';
  static const String deepLinkHost = 'app';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Shimmer
  static const Duration shimmerDuration = Duration(milliseconds: 1500);
  static const int shimmerItemCount = 10;
}