import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required String id,
    required String userId,
    required List<CartItem> items,
    DateTime? updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExtension on Cart {
  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
  int get itemCount => items.length;
  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);
  
  int get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);
  
  List<CartItem> get validItems => items.where((item) => item.isValid).toList();
  
  bool hasProduct(String productId) {
    return items.any((item) => item.product.id == productId);
  }
  
  CartItem? findItem(String productId, [Map<String, String>? variants]) {
    return items.cast<CartItem?>().firstWhere(
      (item) => 
          item!.product.id == productId &&
          _variantsMatch(item.selectedVariants, variants),
      orElse: () => null,
    );
  }
  
  Cart addItem(CartItem newItem) {
    final existingItem = findItem(newItem.product.id, newItem.selectedVariants);
    
    if (existingItem != null) {
      // Update quantity of existing item
      final updatedItems = items.map((item) {
        if (item.id == existingItem.id) {
          return item.copyWith(quantity: item.quantity + newItem.quantity);
        }
        return item;
      }).toList();
      
      return copyWith(items: updatedItems);
    } else {
      // Add new item
      return copyWith(items: [...items, newItem]);
    }
  }
  
  Cart updateItem(String itemId, int quantity) {
    if (quantity <= 0) {
      return removeItem(itemId);
    }
    
    final updatedItems = items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();
    
    return copyWith(items: updatedItems);
  }
  
  Cart removeItem(String itemId) {
    final updatedItems = items.where((item) => item.id != itemId).toList();
    return copyWith(items: updatedItems);
  }
  
  Cart clear() {
    return copyWith(items: []);
  }
  
  static bool _variantsMatch(
    Map<String, String>? variants1,
    Map<String, String>? variants2,
  ) {
    if (variants1 == null && variants2 == null) return true;
    if (variants1 == null || variants2 == null) return false;
    
    if (variants1.length != variants2.length) return false;
    
    for (final entry in variants1.entries) {
      if (variants2[entry.key] != entry.value) return false;
    }
    
    return true;
  }
}