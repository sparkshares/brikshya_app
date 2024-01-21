import 'package:project_app/data/network/network_api_services.dart';
import 'package:project_app/data/response/api_response.dart';
import 'package:project_app/models/profile/profile_model.dart';
import 'package:project_app/resources/url/app_url.dart';

class ProfileRepository {
  final _apiServices = NetworkApiServices();

  Future<ProfileModel> profileApi() async {
    ApiResponse<dynamic> response =
        await _apiServices.getReq(AppUrl.userProfileApi());
    if (response.data is Map<String, dynamic>) {
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load profile data');
    }
  }
}
