import 'package:project_app/data/network/network_api_services.dart';
import 'package:project_app/data/response/api_response.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/models/auth/auth_model.dart';
import 'package:project_app/resources/url/app_url.dart';

class RegisterRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> registerApi(var data) async {
    dynamic response = await _apiServices.postReq(data, AppUrl.registerApi());
    return response;
  }
}
