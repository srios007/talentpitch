import 'package:dio/dio.dart';
import 'package:talentpitch/app/models/challenge.dart';
import 'package:talentpitch/app/services/http/dioException.dart';
import 'package:talentpitch/app/services/http/dioService.dart';

class ChallengeService {
  factory ChallengeService() {
    return _instance;
  }

  ChallengeService._internal();
  static final ChallengeService _instance = ChallengeService._internal();

  Future<List<Challenge>> getChallenges(String url) async {
    try {
      final response =
          await DioClient.instance.get(url);
      final ChallengeList =
          (response['data'] as List).map((e) => Challenge.fromJson(e)).toList();
      return ChallengeList;
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }
}

ChallengeService challengeService = ChallengeService();
