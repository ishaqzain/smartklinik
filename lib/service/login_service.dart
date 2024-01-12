import 'package:smartklinik/helpers/user_info.dart';
import 'package:dio/dio.dart';
import 'package:smartklinik/helpers/api_client.dart';
import 'package:smartklinik/model/pegawai.dart';

class LoginService {
  Future<bool> login(String email, String password) async {
    final Response response = await ApiClient().get('pegawai/?key=123');
    print(response.data);

    final List data = response.data['data'] as List;
    List<Pegawai> result = data.map((json) => Pegawai.fromJson(json)).toList();

    bool isLogin = false;

    for (Pegawai pegawai in result) {
      if (pegawai.email == email && pegawai.password == password) {
        isLogin = true;
        await UserInfo().setToken(pegawai.nama);
        await UserInfo().setUserID(pegawai.nip);
        await UserInfo().setUserName(pegawai.nama);
        await UserInfo().setEmail(pegawai.email);
        break; // Exit the loop once a match is found
      }
    }

    return isLogin;
  }
}
