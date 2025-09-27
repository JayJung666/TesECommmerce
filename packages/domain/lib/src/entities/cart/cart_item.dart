import 'package:freezed_annotation/freezed_annotation.dart';
import '../product/product.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required Product product,
    required int quantity,
    Map<String, String>? selectedVariants, // e.g., {"color": "red", "size": "M"}
    DateTime? addedAt,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}

extension CartItemExtension on CartItem {
  int get totalPrice => product.finalPrice * quantity;
  
  bool get isValid => product.inStock && quantity > 0;
  
  CartItem incrementQuantity() => copyWith(quantity: quantity + 1);
  
  CartItem decrementQuantity() => quantity > 1 
      ? copyWith(quantity: quantity - 1)
      : this;
  
  CartItem updateQuantity(int newQuantity) => copyWith(
        quantity: newQuantity > 0 ? newQuantity : 1,
      );
}