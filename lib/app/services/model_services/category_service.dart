import 'package:dio/dio.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/services/http/dioException.dart';
import 'package:talentpitch/app/services/http/dioService.dart';

class CategoryService {
  factory CategoryService() {
    return _instance;
  }

  CategoryService._internal();
  static final CategoryService _instance = CategoryService._internal();

  Future<List<Category>> getCategories() async {
    try {
      final response =
          await DioClient.instance.get('/homeservice/categories/all/12');
      final categoryList = (response['data'] as List)
          .map(
            (e) => Category.fromJson(e),
          )
          .toList();
      return categoryList;
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }
}

CategoryService categoryService = CategoryService();
