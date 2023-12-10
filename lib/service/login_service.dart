import 'package:smartklinik/helpers/user_info.dart';

class LoginService{
  Future<bool> login(String username, String password) async{
    bool isLogin = false;
    if (username == 'admin' && password == 'admin'){
      await UserInfo().setToken('admin');
      await UserInfo().setUserID("1");
      await UserInfo().setUserName('admin');
      isLogin = true;
    }
    return isLogin;
  }
}
