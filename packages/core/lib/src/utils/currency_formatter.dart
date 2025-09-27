import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _idrFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static final NumberFormat _usdFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$ ',
    decimalDigits: 2,
  );

  /// Format price in Indonesian Rupiah
  /// [amount] should be in minor units (e.g., 100000 for Rp 100.000)
  static String formatIDR(int amount) {
    return _idrFormatter.format(amount);
  }

  /// Format price in US Dollars
  /// [amount] should be in minor units (e.g., 1000 for $10.00)
  static String formatUSD(int amount) {
    return _usdFormatter.format(amount / 100);
  }

  /// Format price based on currency code
  static String formatCurrency(int amount, String currencyCode) {
    switch (currencyCode.toUpperCase()) {
      case 'IDR':
        return formatIDR(amount);
      case 'USD':
        return formatUSD(amount);
      default:
        return formatIDR(amount);
    }
  }

  /// Format discount percentage
  static String formatDiscount(double percentage) {
    return '${percentage.toInt()}%';
  }

  /// Calculate discount amount
  static int calculateDiscountAmount(int originalPrice, double discountPercentage) {
    return (originalPrice * discountPercentage / 100).round();
  }

  /// Calculate final price after discount
  static int calculateFinalPrice(int originalPrice, double discountPercentage) {
    final discountAmount = calculateDiscountAmount(originalPrice, discountPercentage);
    return originalPrice - discountAmount;
  }

  /// Parse currency string to amount in minor units
  static int parseCurrency(String currencyString) {
    // Remove currency symbols and formatting
    final cleanString = currencyString
        .replaceAll('Rp', '')
        .replaceAll('\$', '')
        .replaceAll(',', '')
        .replaceAll('.', '')
        .trim();
    
    return int.tryParse(cleanString) ?? 0;
  }

  /// Format number with thousand separators
  static String formatNumber(int number) {
    final formatter = NumberFormat('#,###', 'id_ID');
    return formatter.format(number);
  }
}