# Atlantis Shop - Production-Ready Flutter E-Commerce App

A modern, scalable Flutter e-commerce application built with clean architecture principles, featuring a complete shopping experience with authentication, product catalog, cart management, and payment processing.

## 🏗️ Architecture

This project follows **Clean Architecture** with a modular approach:

```
📁 /
├── 📁 apps/mobile/                 # Main Flutter application
├── 📁 packages/
│   ├── 📁 core/                   # Core utilities, theme, error handling
│   ├── 📁 data/                   # Data sources & repository implementations
│   ├── 📁 domain/                 # Business logic, entities & use cases
│   └── 📁 features/               # Feature modules
│       ├── 📁 auth/               # Authentication
│       ├── 📁 catalog/            # Product catalog
│       ├── 📁 product_detail/     # Product details
│       ├── 📁 cart/               # Shopping cart
│       ├── 📁 checkout/           # Checkout process
│       ├── 📁 orders/             # Order management
│       ├── 📁 profile/            # User profile
│       ├── 📁 wishlist/           # Wishlist
│       └── 📁 search/             # Product search
└── 📁 .github/workflows/          # CI/CD pipelines
```

### Layer Separation

- **Domain Layer**: Business logic, entities, repository contracts, use cases
- **Data Layer**: API clients, local storage, repository implementations
- **Presentation Layer**: UI components, screens, state management

## 🚀 Features

### Core Features (MVP)
- ✅ **Authentication**: Email/password, Google/Apple Sign-In
- ✅ **Product Catalog**: Categories, pagination, search & filters
- ✅ **Product Details**: Image gallery, specifications, reviews
- ✅ **Shopping Cart**: Add/remove items, quantity management
- ✅ **Checkout**: Address management, payment processing
- ✅ **Order Management**: Order history, tracking, status updates
- ✅ **User Profile**: Profile management, preferences
- ✅ **Wishlist**: Save favorite products
- ✅ **Search**: Advanced search with filters

### Technical Features
- 🎨 **Modern UI**: Material Design 3, dark/light themes
- 🌐 **Internationalization**: Indonesian & English support
- 📱 **Responsive Design**: Optimized for different screen sizes
- 🔄 **State Management**: Riverpod for reactive state management
- 🚦 **Navigation**: GoRouter with type-safe routing
- 💾 **Offline Support**: Local caching and offline-first approach
- 🔐 **Security**: Secure storage, input validation, TLS pinning
- 🧪 **Testing**: Unit, widget, and integration tests
- 📊 **Analytics**: Firebase Analytics & Crashlytics integration

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| **Framework** | Flutter 3.16+ |
| **Language** | Dart 3.0+ (null-safety) |
| **State Management** | Riverpod |
| **Routing** | GoRouter |
| **HTTP Client** | Dio |
| **Code Generation** | Freezed, JSON Serializable |
| **Storage** | Flutter Secure Storage, SharedPreferences |
| **Backend** | Firebase (Auth, Firestore, Storage, FCM) |
| **Images** | Cached Network Image |
| **Payments** | Midtrans, Stripe (abstracted) |
| **Localization** | Flutter Intl |
| **Testing** | Flutter Test, Mocktail |
| **CI/CD** | GitHub Actions |

## 🎨 Design System

### Brand Colors
- **Primary**: `#46E5DA` (Turquoise)
- **Accent**: `#123B38` (Dark Teal)
- **Currency**: IDR (Indonesian Rupiah)
- **Locale**: id_ID (Indonesian) with en_US support

### Typography
- **Font Family**: Inter
- **Hierarchy**: Display, Headline, Title, Body, Label styles
- **Responsive**: Scalable text for accessibility

### Spacing System
- **Base Unit**: 8dp
- **Scale**: 4, 8, 16, 24, 32, 48, 64dp
- **Border Radius**: 4, 8, 12, 16, 24dp

## 🏁 Getting Started

### Prerequisites
- Flutter SDK 3.16.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions
- Firebase account (for backend services)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/JayJung666/TesECommmerce.git
   cd TesECommmerce
   ```

2. **Install Flutter dependencies**
   ```bash
   cd apps/mobile
   flutter pub get
   ```

3. **Install dependencies for all packages**
   ```bash
   # From project root
   for package in packages/*/; do
     if [ -f "$package/pubspec.yaml" ]; then
       cd "$package" && flutter pub get && cd -
     fi
   done
   ```

4. **Generate code**
   ```bash
   cd apps/mobile
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Set up environment variables**
   Create `.env` file or use `--dart-define`:
   ```bash
   --dart-define=API_BASE_URL=https://api.atlantisshop.com/v1
   --dart-define=MIDTRANS_CLIENT_KEY=your_midtrans_key
   --dart-define=STRIPE_PUBLISHABLE_KEY=your_stripe_key
   ```

### Running the App

#### Development
```bash
cd apps/mobile
flutter run --flavor dev -t lib/main_dev.dart
```

#### Staging
```bash
cd apps/mobile
flutter run --flavor staging -t lib/main_staging.dart
```

#### Production
```bash
cd apps/mobile
flutter run --flavor prod -t lib/main.dart
```

### Building

#### Android APK
```bash
cd apps/mobile
flutter build apk --flavor dev -t lib/main_dev.dart
```

#### iOS
```bash
cd apps/mobile
flutter build ios --flavor prod -t lib/main.dart
```

## 🧪 Testing

### Unit Tests
```bash
cd apps/mobile
flutter test
```

### Widget Tests
```bash
cd apps/mobile
flutter test test/widget_test.dart
```

### Integration Tests
```bash
cd apps/mobile
flutter test integration_test/
```

### Coverage Report
```bash
cd apps/mobile
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 🔧 Development Guidelines

### Code Style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter_lints` for consistent code style
- Run `dart format .` before committing
- Use meaningful variable and function names

### Architecture Principles
- **Separation of Concerns**: Each layer has a single responsibility
- **Dependency Inversion**: Higher layers don't depend on lower layers
- **Testability**: All business logic is testable
- **Scalability**: Easy to add new features without breaking existing code

### State Management Patterns
- Use **Riverpod** for all state management
- Keep state immutable using **Freezed**
- Use **AsyncValue** for loading states
- Implement proper error handling

### Git Workflow
1. Create feature branch from `develop`
2. Make changes following coding standards
3. Write/update tests
4. Create pull request to `develop`
5. After review, merge to `develop`
6. Release branches merge to `main`

## 📁 Project Structure Details

### Core Package (`packages/core/`)
- **Theme System**: Colors, typography, spacing
- **Error Handling**: Standardized error types and Result wrapper
- **Network Layer**: Dio configuration and interceptors
- **Utilities**: Currency formatter, validators, constants

### Domain Package (`packages/domain/`)
- **Entities**: Core business objects (Product, User, Order)
- **Repositories**: Abstract contracts for data access
- **Use Cases**: Business logic operations
- **Value Objects**: Domain-specific types

### Data Package (`packages/data/`)
- **Data Sources**: Remote and local data access
- **Repository Implementations**: Concrete repository implementations
- **DTOs**: Data transfer objects for API communication
- **Mappers**: Convert between DTOs and entities

### Feature Packages
Each feature package contains:
- **Presentation**: Screens, widgets, controllers
- **State**: Riverpod providers and state classes
- **Models**: Feature-specific models

## 🔐 Security Features

- **Input Validation**: All user inputs are validated and sanitized
- **Secure Storage**: Sensitive data stored using Flutter Secure Storage
- **Network Security**: HTTPS only, certificate pinning
- **Authentication**: Firebase Auth with proper token management
- **Error Handling**: No sensitive information in error messages

## 🌐 Internationalization

The app supports multiple languages with proper formatting:

- **Indonesian (id_ID)**: Default language
- **English (en_US)**: Secondary language
- **Currency**: IDR formatting with proper localization
- **Date/Time**: Localized formatting
- **Numbers**: Locale-appropriate number formatting

## 💳 Payment Integration

Abstract payment gateway system supporting:

- **Midtrans**: Indonesian payment gateway (sandbox mode)
- **Stripe**: International payments (test mode)
- **Extensible**: Easy to add new payment providers

## 📊 Analytics & Monitoring

- **Firebase Analytics**: User behavior and app usage
- **Firebase Crashlytics**: Crash reporting and analysis
- **Performance Monitoring**: App performance metrics
- **Custom Events**: Business-specific tracking

## 🚀 CI/CD Pipeline

GitHub Actions workflow includes:
- **Code Quality**: Linting, formatting, analysis
- **Testing**: Unit, widget, and integration tests
- **Building**: Multi-flavor APK/IPA generation
- **Coverage**: Test coverage reporting
- **Deployment**: Automated deployment to app stores

## 📱 Supported Platforms

- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 12.0+
- **Web**: Modern browsers (Chrome, Firefox, Safari, Edge)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Review Checklist
- [ ] Code follows project conventions
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No breaking changes (or properly documented)
- [ ] Performance implications considered

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the GitHub repository
- Check existing documentation
- Review code examples in the project

## 🗺️ Roadmap

### Phase 1 (Current)
- [x] Basic app structure and navigation
- [x] Authentication system
- [x] Product catalog with search
- [x] Shopping cart functionality
- [x] Basic checkout flow

### Phase 2 (Upcoming)
- [ ] Advanced payment integration
- [ ] Push notifications
- [ ] Offline synchronization
- [ ] Advanced analytics
- [ ] Performance optimizations

### Phase 3 (Future)
- [ ] Social features (reviews, sharing)
- [ ] Recommendation engine
- [ ] Advanced personalization
- [ ] Multi-vendor support
- [ ] Admin dashboard

---

**Made with ❤️ using Flutter & Clean Architecture**