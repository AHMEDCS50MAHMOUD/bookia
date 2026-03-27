import 'package:bookia/core/networking/api_constant.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/cart/data/models/cart_models.dart';
import 'package:flutter/foundation.dart';

class CartRepo {
  static Future<CartModel?> getCart() async {
    try {
      final response = await DioFactory.dio?.get(ApiConstant.showCart);

      if (response?.statusCode == 200 && response?.data != null) {
        return CartModel.fromJson(response?.data as Map<String, dynamic>);
      } else {
        debugPrint('===> GetCart Error: ${response?.data}');
        return null;
      }
    } catch (e) {
      debugPrint('===> GetCart Exception: $e');
      return null;
    }
  }

  static Future<bool> addToCart(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstant.addToCart,
        data: {'product_id': productId},
      );

      final code = response?.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> AddToCart Error: $e');
      return false;
    }
  }

  static Future<bool> removeFromCart(int cartItemId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstant.removeFromCart,
        data: {'cart_item_id': cartItemId},
      );
      final code = response?.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> RemoveFromCart Error: $e');
      return false;
    }
  }

  static Future<bool> updateCartItem({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstant.updateCart,
        data: {
          'cart_item_id': cartItemId,
          'quantity': quantity,
        },
      );
      final code = response?.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> UpdateCartItem Error: $e');
      return false;
    }
  }
}
