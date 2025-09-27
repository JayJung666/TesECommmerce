library atlantis_domain;

// Entities
export 'src/entities/user/user.dart';
export 'src/entities/product/product.dart';
export 'src/entities/product/category.dart';
export 'src/entities/cart/cart.dart';
export 'src/entities/cart/cart_item.dart';
export 'src/entities/order/order.dart';
export 'src/entities/order/order_item.dart';
export 'src/entities/order/address.dart';
export 'src/entities/common/paged_list.dart';

// Repositories
export 'src/repositories/auth_repository.dart';
export 'src/repositories/product_repository.dart';
export 'src/repositories/cart_repository.dart';
export 'src/repositories/order_repository.dart';
export 'src/repositories/user_repository.dart';

// Use Cases
export 'src/usecases/auth/login_with_email.dart';
export 'src/usecases/auth/login_with_google.dart';
export 'src/usecases/auth/register_with_email.dart';
export 'src/usecases/auth/logout.dart';
export 'src/usecases/product/get_products.dart';
export 'src/usecases/product/get_product_by_id.dart';
export 'src/usecases/cart/add_to_cart.dart';
export 'src/usecases/cart/get_cart.dart';
export 'src/usecases/cart/update_cart_item.dart';
export 'src/usecases/cart/remove_from_cart.dart';
export 'src/usecases/order/create_order.dart';
export 'src/usecases/order/get_orders.dart';