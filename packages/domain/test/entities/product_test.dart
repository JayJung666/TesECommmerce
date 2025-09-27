import 'package:flutter_test/flutter_test.dart';
import 'package:atlantis_domain/atlantis_domain.dart';

void main() {
  group('Product', () {
    late Product product;

    setUp(() {
      product = const Product(
        id: '1',
        name: 'Test Product',
        sku: 'TEST-001',
        categoryId: 'cat-1',
        price: 100000,
        rating: 4.5,
        ratingCount: 100,
        inStock: true,
        images: ['image1.jpg', 'image2.jpg'],
        shortDescription: 'A test product',
        discountPercentage: 10,
        originalPrice: 110000,
      );
    });

    test('should have correct properties', () {
      expect(product.id, '1');
      expect(product.name, 'Test Product');
      expect(product.price, 100000);
      expect(product.rating, 4.5);
      expect(product.inStock, true);
    });

    test('should calculate discount correctly', () {
      expect(product.hasDiscount, true);
      expect(product.finalPrice, 90000); // 10% discount
    });

    test('should return primary image', () {
      expect(product.primaryImage, 'image1.jpg');
    });

    test('should identify popular products', () {
      final popularProduct = product.copyWith(rating: 4.6);
      expect(popularProduct.isPopular, true);
      
      final lowRatedProduct = product.copyWith(rating: 3.0, soldCount: 50);
      expect(lowRatedProduct.isPopular, false);
    });

    test('should handle product without discount', () {
      final noDiscountProduct = product.copyWith(
        discountPercentage: null,
        originalPrice: null,
      );
      
      expect(noDiscountProduct.hasDiscount, false);
      expect(noDiscountProduct.finalPrice, 100000);
    });

    test('should handle empty images', () {
      final noImageProduct = product.copyWith(images: []);
      expect(noImageProduct.primaryImage, '');
    });
  });
}