import 'package:dio/dio.dart';
import 'package:lavelapp/model/user_model.dart';

class DioClient {
  final Dio _dio = Dio();

  String url = "https://myjson.dit.upm.es/api/bins/gbt5";

  Future<DataFormUser?> getUser() async {
    DataFormUser? user;
    try {
      Response userData = await _dio.get(url);
      print('User Info: ${userData.data}');
      user = DataFormUser.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }
}
