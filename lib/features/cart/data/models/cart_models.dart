import 'package:bookia/features/home/data/models/books_model.dart';

class CartModel {
  CartData? data;
  String? message;
  int? status;

  CartModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status'] is int
        ? json['status'] as int
        : int.tryParse(json['status']?.toString() ?? '');

    final rawData = json['data'];
    if (rawData is Map<String, dynamic>) {
      data = CartData.fromJson(rawData);
    }
  }
}

class CartData {
  List<CartItem>? cartItems;
  double? total;

  CartData.fromJson(Map<String, dynamic> json) {
    final rawItems = json['cart_items'] ?? json['items'] ?? json['data'];
    if (rawItems is Iterable) {
      cartItems = <CartItem>[];
      for (final item in rawItems) {
        if (item is Map<String, dynamic>) {
          cartItems!.add(CartItem.fromJson(item));
        }
      }
    }

    final rawTotal = json['total'];
    if (rawTotal is num) {
      total = rawTotal.toDouble();
    } else if (rawTotal is String) {
      total = double.tryParse(rawTotal);
    }
  }
}

class CartItem {
  int? id;
  Product? product;
  int? quantity;

  CartItem.fromJson(Map<String, dynamic> json) {
    id = _parseIntField(json['item_id'] ?? json['id']);

    final rawProduct = json['product'];
    if (rawProduct is Map<String, dynamic>) {
      product = Product.fromJson(rawProduct);
    } else {
      product = Product(
        id: _parseIntField(json['item_product_id']),
        name: json['item_product_name']?.toString(),
        price: json['item_product_price']?.toString(),
        image: json['item_product_image']?.toString(),
      );
    }

    quantity = _parseIntField(json['item_quantity'] ?? json['quantity']);
  }
}

int? _parseIntField(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
