import 'dart:convert';

import 'package:behandam/features/data/base_api.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ProfileProvider {
  // Api
  final BaseApi _api = BaseApi();

  ///
  /// ---------- Vars ----------
  ///

  static List<String> permissionList = [];
  static List<String> settingList = [];

  ///
  /// ---------- Apis ----------
  ///

  Future profile() async {
    var headers = {'Authorization': 'Bearer 1283472|ncqZacuIgfiuF1cI2k8GJKEzOfoXGrFYO9HGhiYj'};
    var dio = Dio();
    var response = await dio.request(
      'https://debug.behaminplus.ir/behandam-diet/api/profile',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      final resultBody = response.data;
      return resultBody;
    } else {
      print(response.statusMessage);
    }
  }
}
