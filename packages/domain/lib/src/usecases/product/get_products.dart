import 'package:atlantis_core/atlantis_core.dart';
import '../../entities/product/product.dart';
import '../../entities/common/paged_list.dart';
import '../../repositories/product_repository.dart';

class GetProducts {
  const GetProducts(this._productRepository);

  final ProductRepository _productRepository;

  Future<Result<PagedList<Product>>> call({
    int page = 1,
    int pageSize = 20,
    String? categoryId,
    String? query,
    SortOption? sort,
    Map<String, dynamic>? filters,
  }) async {
    return _productRepository.getProducts(
      page: page,
      pageSize: pageSize,
      categoryId: categoryId,
      query: query,
      sort: sort,
      filters: filters,
    );
  }
}