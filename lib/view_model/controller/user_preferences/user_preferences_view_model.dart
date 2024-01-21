import 'package:project_app/models/auth/auth_model.dart';
import 'package:project_app/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(AuthModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (responseModel.token != null && responseModel.token!.access != null) {
      sp.setString("token", responseModel.token!.access.toString());
      sp.setString("refreshToken", responseModel.token!.refresh.toString());
      print("The refresh token is this = " +
          responseModel.token!.refresh.toString());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> saveRole(ProfileModel response) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("role", response.role.toString());
    sp.setString("email", response.email.toString());
    sp.setString("name", response.name.toString());
    print(
        "The role is saved, the role is = " + sp.getString("role").toString());
    return true;
  }

  Future<AuthModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? accessToken = sp.getString("token");
    String? refreshToken = sp.getString("refreshToken");
    String? role = sp.getString("role");
    Token? token = accessToken != null ? Token(access: accessToken) : null;
    return AuthModel(token: token, msg: "success");
  }

  Future<String?> getRole() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print("The role is = " + sp.getString("role").toString());
    return sp.getString("role");
  }

  Future<String?> getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print("The name is = " + sp.getString("name").toString());
    return sp.getString("name");
  }

  Future<String?> getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print("The email is = " + sp.getString("email").toString());
    return sp.getString("email");
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
