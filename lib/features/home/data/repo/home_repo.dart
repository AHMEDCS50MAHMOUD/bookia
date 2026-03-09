import 'package:bookia/core/networking/api_constant.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/home/data/models/slider_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static final Dio _dio = Dio();

  static Future<SliderModel?> getHomeSliders() async {
    try {
      final response = await DioFactory.dio?.get(ApiConstant.slider);
      if (response?.statusCode == 200) {
        return SliderModel.fromJson(response?.data??"");
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<BooksModel?> getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get(ApiConstant.bestSeller);
      if (response?.statusCode == 200) {
        return BooksModel.fromJson(response?.data??"");
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
