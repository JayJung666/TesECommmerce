import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String sku,
    required String categoryId,
    required int price, // in minor units (IDR)
    required double rating,
    required int ratingCount,
    required bool inStock,
    required List<String> images,
    String? shortDescription,
    String? longDescription,
    Map<String, dynamic>? specifications,
    List<String>? tags,
    int? discountPercentage,
    int? originalPrice,
    String? brand,
    double? weight,
    Map<String, List<String>>? variants, // e.g., {"color": ["red", "blue"], "size": ["S", "M", "L"]}
    @Default(0) int viewCount,
    @Default(0) int soldCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

extension ProductExtension on Product {
  bool get hasDiscount => discountPercentage != null && discountPercentage! > 0;
  
  int get finalPrice => hasDiscount 
      ? (price * (100 - discountPercentage!) / 100).round()
      : price;
  
  String get primaryImage => images.isNotEmpty 
      ? images.first 
      : '';
  
  bool get isPopular => soldCount > 100 || rating >= 4.5;
  
  bool get isNew => createdAt != null && 
      DateTime.now().difference(createdAt!).inDays <= 30;
}