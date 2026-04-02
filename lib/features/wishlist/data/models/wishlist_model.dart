import 'package:bookia/features/home/data/models/books_model.dart';

class WishlistModel {
  WishlistData? data;
  String? message;
  int? status;

  WishlistModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status'] is int
        ? json['status'] as int
        : int.tryParse(json['status']?.toString() ?? '');

    final rawData = json['data'];
    if (rawData is Map<String, dynamic>) {
      data = WishlistData.fromJson(rawData);
    } else if (rawData is List) {
      data = WishlistData.fromList(rawData);
    }
  }
}

class WishlistData {
  List<Product>? products;

  WishlistData.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'] ?? json['data'];
    _parseProducts(rawProducts);
  }

  WishlistData.fromList(List<dynamic> list) {
    _parseProducts(list);
  }

  void _parseProducts(dynamic rawProducts) {
    if (rawProducts is Iterable) {
      products = <Product>[];
      for (final item in rawProducts) {
        if (item is Map<String, dynamic>) {
          products!.add(Product.fromJson(item));
        }
      }
    }
  }
}
