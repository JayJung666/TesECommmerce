import 'package:flutter_test/flutter_test.dart';
import 'package:atlantis_core/atlantis_core.dart';

void main() {
  group('CurrencyFormatter', () {
    test('should format IDR correctly', () {
      expect(CurrencyFormatter.formatIDR(100000), 'Rp 100.000');
      expect(CurrencyFormatter.formatIDR(1500000), 'Rp 1.500.000');
      expect(CurrencyFormatter.formatIDR(0), 'Rp 0');
    });

    test('should format USD correctly', () {
      expect(CurrencyFormatter.formatUSD(1000), '\$ 10.00');
      expect(CurrencyFormatter.formatUSD(15050), '\$ 150.50');
      expect(CurrencyFormatter.formatUSD(0), '\$ 0.00');
    });

    test('should format currency based on code', () {
      expect(CurrencyFormatter.formatCurrency(100000, 'IDR'), 'Rp 100.000');
      expect(CurrencyFormatter.formatCurrency(1000, 'USD'), '\$ 10.00');
      expect(CurrencyFormatter.formatCurrency(100000, 'UNKNOWN'), 'Rp 100.000'); // defaults to IDR
    });

    test('should format discount percentage', () {
      expect(CurrencyFormatter.formatDiscount(10.5), '10%');
      expect(CurrencyFormatter.formatDiscount(25.9), '25%');
      expect(CurrencyFormatter.formatDiscount(0), '0%');
    });

    test('should calculate discount amount', () {
      expect(CurrencyFormatter.calculateDiscountAmount(100000, 10), 10000);
      expect(CurrencyFormatter.calculateDiscountAmount(150000, 25), 37500);
      expect(CurrencyFormatter.calculateDiscountAmount(100000, 0), 0);
    });

    test('should calculate final price after discount', () {
      expect(CurrencyFormatter.calculateFinalPrice(100000, 10), 90000);
      expect(CurrencyFormatter.calculateFinalPrice(150000, 25), 112500);
      expect(CurrencyFormatter.calculateFinalPrice(100000, 0), 100000);
    });

    test('should parse currency string', () {
      expect(CurrencyFormatter.parseCurrency('Rp 100.000'), 100000);
      expect(CurrencyFormatter.parseCurrency('\$ 10.00'), 1000);
      expect(CurrencyFormatter.parseCurrency('100,000'), 100000);
      expect(CurrencyFormatter.parseCurrency('invalid'), 0);
    });

    test('should format number with separators', () {
      expect(CurrencyFormatter.formatNumber(1000), '1.000');
      expect(CurrencyFormatter.formatNumber(1000000), '1.000.000');
      expect(CurrencyFormatter.formatNumber(123), '123');
    });
  });
}