import 'package:atlantis_core/atlantis_core.dart';
import '../entities/product/product.dart';
import '../entities/common/paged_list.dart';

enum SortOption {
  newest,
  oldest,
  priceAsc,
  priceDesc,
  rating,
  popularity,
  nameAsc,
  nameDesc,
}

abstract class ProductRepository {
  /// Get paginated list of products with optional filters
  Future<Result<PagedList<Product>>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? categoryId,
    String? query,
    SortOption? sort,
    Map<String, dynamic>? filters,
  });

  /// Get a specific product by ID
  Future<Result<Product>> getProductById(String id);

  /// Search products with query
  Future<Result<PagedList<Product>>> searchProducts({
    required String query,
    int page = 1,
    int pageSize = 20,
    SortOption? sort,
    Map<String, dynamic>? filters,
  });

  /// Get products by category
  Future<Result<PagedList<Product>>> getProductsByCategory({
    required String categoryId,
    int page = 1,
    int pageSize = 20,
    SortOption? sort,
    Map<String, dynamic>? filters,
  });

  /// Get featured/recommended products
  Future<Result<List<Product>>> getFeaturedProducts({
    int limit = 10,
  });

  /// Get popular products
  Future<Result<List<Product>>> getPopularProducts({
    int limit = 10,
  });

  /// Get new arrival products
  Future<Result<List<Product>>> getNewArrivals({
    int limit = 10,
  });

  /// Get related products
  Future<Result<List<Product>>> getRelatedProducts({
    required String productId,
    int limit = 5,
  });
}