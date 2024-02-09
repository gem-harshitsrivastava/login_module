import 'dart:convert';

import 'package:dio/dio.dart';

class SendOTPRepository {
  Future<String> sendOTP(String phone) async {
    try {
      final dio = Dio();
      var model = {'phoneNumber': phone};
      Response response = await dio.post(
          'https://ds4e8cjfof.execute-api.us-east-1.amazonaws.com/send-otp',
          data: jsonDecode('$model'));
      print('response from api $response');
      // ApiResponse apiResponse =
      //     ApiResponse.fromResponse(json.decode(response.data));
      // if (response.statusCode != 200) {
      //   throw apiResponse.message.toString();
      // }
      // print(apiResponse.data);
      return '';
    } catch (e) {
      rethrow;
    }
  }
}
