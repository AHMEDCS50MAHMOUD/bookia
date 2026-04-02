import 'package:bookia/core/networking/api_constant.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_model.dart';
import 'package:flutter/foundation.dart';

class WishlistRepo {
  static Future<WishlistModel?> getWishlist() async {
    try {
      final response = await DioFactory.dio?.get(ApiConstant.wishlist);
      if (response?.statusCode == 200 && response?.data != null) {
        return WishlistModel.fromJson(response?.data as Map<String, dynamic>);
      } else {
        debugPrint(response?.data.toString());
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool> addToWishlist(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstant.addToWishlist,
        data: {'product_id': productId},
      );
      final code = response?.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> addToWishlist Error: $e');
      return false;
    }
  }

  static Future<bool> removeFromWishlist(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstant.removeFromWishlist,
        data: {'product_id': productId},
      );
      final code = response?.statusCode ?? 0;
      return code >= 200 && code < 300;
    } catch (e) {
      debugPrint('===> removeFromWishlist Error: $e');
      return false;
    }
  }
}
