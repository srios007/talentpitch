import 'package:dio/dio.dart';
import 'package:talentpitch/app/models/talent.dart';
import 'package:talentpitch/app/services/http/dioException.dart';
import 'package:talentpitch/app/services/http/dioService.dart';

class TalenteeService {
  factory TalenteeService() {
    return _instance;
  }

  TalenteeService._internal();
  static final TalenteeService _instance = TalenteeService._internal();

  Future<List<Talent>> getTalentees(String url) async {
    try {
      final response =
          await DioClient.instance.get(url);
      print('Response $response');
      final TalenteeList =
          (response['data'] as List).map((e) => Talent.fromJson(e)).toList();
      return TalenteeList;
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }
}

TalenteeService talenteeService = TalenteeService();
