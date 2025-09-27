# Contributing to Atlantis Shop

Thank you for your interest in contributing to Atlantis Shop! This document provides guidelines and instructions for contributing to the project.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Architecture Guidelines](#architecture-guidelines)

## 🤝 Code of Conduct

This project adheres to a code of conduct that we expect all contributors to follow. Please be respectful and constructive in all interactions.

## 🚀 Getting Started

1. **Fork the repository** to your GitHub account
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/TesECommmerce.git
   cd TesECommmerce
   ```
3. **Set up the upstream remote**:
   ```bash
   git remote add upstream https://github.com/JayJung666/TesECommmerce.git
   ```

## 🛠️ Development Setup

### Prerequisites
- Flutter SDK 3.16.0+
- Dart SDK 3.0.0+
- Android Studio / VS Code
- Git

### Installation
1. **Install dependencies**:
   ```bash
   cd apps/mobile
   flutter pub get
   
   # Install dependencies for all packages
   for package in packages/*/; do
     if [ -f "$package/pubspec.yaml" ]; then
       cd "$package" && flutter pub get && cd -
     fi
   done
   ```

2. **Generate code**:
   ```bash
   cd apps/mobile
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app**:
   ```bash
   flutter run --flavor dev -t lib/main_dev.dart
   ```

## 🔄 Making Changes

### Branch Naming Convention
Use descriptive branch names:
- `feature/add-payment-integration`
- `bugfix/fix-cart-calculation`
- `docs/update-readme`
- `refactor/improve-error-handling`

### Commit Message Format
Follow conventional commits:
```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Tests
- `chore`: Maintenance

Examples:
```
feat(auth): add Google sign-in integration
fix(cart): resolve quantity update issue
docs(readme): update installation instructions
```

## 💻 Coding Standards

### Dart/Flutter Standards
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter_lints` package rules
- Format code with `dart format`
- Document public APIs with DartDoc comments

### Code Style
```dart
// Good
class ProductRepository {
  /// Fetches products with optional pagination and filters.
  /// 
  /// Returns a [Result] containing [PagedList<Product>] on success
  /// or [AppFailure] on error.
  Future<Result<PagedList<Product>>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? categoryId,
  }) async {
    // Implementation
  }
}

// Bad
class ProductRepository {
  Future<Result<PagedList<Product>>> getProducts(int page, int pageSize, String categoryId) async {
    // Implementation
  }
}
```

### Architecture Principles
- **Clean Architecture**: Separate domain, data, and presentation layers
- **SOLID Principles**: Follow single responsibility, open/closed, etc.
- **Dependency Injection**: Use Riverpod providers for dependency management
- **Immutability**: Use Freezed for immutable data classes

## 🧪 Testing Guidelines

### Test Coverage Requirements
- **Domain Layer**: 90%+ coverage
- **Data Layer**: 85%+ coverage
- **Presentation Layer**: 70%+ coverage

### Test Types

#### Unit Tests
```dart
// Test domain entities
test('should calculate discount correctly', () {
  final product = Product(/* ... */);
  expect(product.finalPrice, expectedValue);
});

// Test use cases
test('should return products when repository succeeds', () async {
  // Arrange
  when(() => mockRepository.getProducts()).thenAnswer(
    (_) async => const Result.success(mockProducts),
  );
  
  // Act
  final result = await useCase();
  
  // Assert
  expect(result.isSuccess, true);
  expect(result.data, mockProducts);
});
```

#### Widget Tests
```dart
testWidgets('should display product information', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: ProductCard(product: mockProduct),
    ),
  );
  
  expect(find.text(mockProduct.name), findsOneWidget);
  expect(find.text(mockProduct.price.toString()), findsOneWidget);
});
```

#### Integration Tests
```dart
testWidgets('should complete checkout flow', (tester) async {
  // Navigate through the entire checkout process
  await tester.pumpWidget(MyApp());
  
  // Add product to cart
  await tester.tap(find.text('Add to Cart'));
  await tester.pumpAndSettle();
  
  // Navigate to checkout
  await tester.tap(find.text('Checkout'));
  await tester.pumpAndSettle();
  
  // Complete payment
  await tester.tap(find.text('Pay Now'));
  await tester.pumpAndSettle();
  
  // Verify success
  expect(find.text('Order Placed'), findsOneWidget);
});
```

### Running Tests
```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart

# Integration tests
flutter test integration_test/

# Coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 📝 Pull Request Process

### Before Submitting
1. **Sync with upstream**:
   ```bash
   git fetch upstream
   git checkout develop
   git merge upstream/develop
   ```

2. **Run quality checks**:
   ```bash
   # Format code
   dart format .
   
   # Analyze code
   flutter analyze
   
   # Run tests
   flutter test
   
   # Check coverage
   flutter test --coverage
   ```

3. **Update documentation** if needed

### PR Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Tests added/updated and passing
- [ ] Documentation updated
- [ ] No breaking changes (or properly documented)
- [ ] Performance implications considered
- [ ] Accessibility considerations addressed

### PR Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests pass
- [ ] Widget tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Screenshots (if applicable)
Add screenshots for UI changes

## Additional Notes
Any additional information for reviewers
```

## 🏗️ Architecture Guidelines

### Package Structure
```
packages/
├── core/           # Shared utilities, theme, error handling
├── domain/         # Business logic, entities, use cases
├── data/           # Data sources, repositories
└── features/       # Feature-specific modules
    ├── auth/       # Authentication
    ├── catalog/    # Product catalog
    ├── cart/       # Shopping cart
    └── ...
```

### Layer Dependencies
```
Presentation Layer
       ↓
Domain Layer (Business Logic)
       ↓
Data Layer (External Sources)
```

### State Management with Riverpod
```dart
// State class
@freezed
class ProductState with _$ProductState {
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded(List<Product> products) = _Loaded;
  const factory ProductState.error(String message) = _Error;
}

// Controller
@riverpod
class ProductController extends _$ProductController {
  @override
  Future<ProductState> build() async {
    // Implementation
  }
  
  Future<void> loadProducts() async {
    // Implementation
  }
}
```

### Error Handling
```dart
// Use Result type for operations that can fail
Future<Result<Product>> getProduct(String id) async {
  try {
    final product = await repository.getProduct(id);
    return Result.success(product);
  } catch (e) {
    return Result.failure(AppFailure.unknown(message: e.toString()));
  }
}
```

## 🔍 Code Review Guidelines

### As a Reviewer
- Be constructive and respectful
- Focus on code quality, not personal preferences
- Suggest improvements with examples
- Approve when code meets standards

### As an Author
- Respond to feedback promptly
- Ask questions if feedback is unclear
- Make requested changes or explain why not
- Thank reviewers for their time

## 📞 Getting Help

- **Issues**: Create a GitHub issue for bugs or feature requests
- **Discussions**: Use GitHub Discussions for questions
- **Documentation**: Check existing documentation first
- **Code Examples**: Look at existing code in the project

## 🎯 Areas for Contribution

We welcome contributions in these areas:

### High Priority
- [ ] Payment gateway integrations
- [ ] Push notification system
- [ ] Offline synchronization
- [ ] Performance optimizations
- [ ] Accessibility improvements

### Medium Priority
- [ ] Additional localization languages
- [ ] Advanced search filters
- [ ] Social authentication providers
- [ ] Dark mode refinements
- [ ] Animation improvements

### Low Priority
- [ ] Additional themes
- [ ] Advanced analytics
- [ ] A/B testing framework
- [ ] Advanced caching strategies

Thank you for contributing to Atlantis Shop! 🚀