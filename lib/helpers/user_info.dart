import 'package:shared_preferences/shared_preferences.dart';
const String token ='token';
const String userId ='userID';
const String username = 'username';
const String email = 'email';
class UserInfo{
  Future setToken(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(token, value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(token);
  }

  Future setUserID(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userId, value);
  }

  Future<String?> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userId).toString();
  }

  Future setUserName(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(username, value);
  }

  Future<String?> getUserName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(username).toString();
  }

  Future setEmail(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(email, value);
  }

  Future<String?> getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(email).toString();
  }

  Future<void> logout() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}
