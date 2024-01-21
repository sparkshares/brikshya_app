import 'package:project_app/data/network/network_api_services.dart';
import 'package:project_app/resources/url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiServices.postReq(data, AppUrl.loginApi());
    return response;
  }
}
