import 'package:dio/dio.dart';
import 'package:talentpitch/app/models/company.dart';
import 'package:talentpitch/app/services/http/dioException.dart';
import 'package:talentpitch/app/services/http/dioService.dart';

class CompanyService {
  factory CompanyService() {
    return _instance;
  }

  CompanyService._internal();
  static final CompanyService _instance = CompanyService._internal();

  Future<List<Company>> getCompanies(String url) async {
    try {
      final response =
          await DioClient.instance.get(url);
      print('Response $response');
      final CompanyList =
          (response['data'] as List).map((e) => Company.fromJson(e)).toList();
      return CompanyList;
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }
}

CompanyService companyService = CompanyService();
