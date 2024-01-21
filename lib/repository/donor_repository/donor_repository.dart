import 'package:project_app/data/network/network_api_services.dart';
import 'package:project_app/data/response/api_response.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/models/donor_donation_list/donor_donation_list.dart';
import 'package:project_app/resources/url/app_url.dart';

class DonorRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> makeDonationApi(var data) async {
    dynamic response =
        await _apiServices.postReq(data, AppUrl.makeDonationApi());
    return response;
  }

  Future<List<DonorDonationList>> getDonationListApi() async {
    ApiResponse<dynamic> response =
        await _apiServices.getReq(AppUrl.getDonationListApi());

    if (response.status == Status.COMPLETED) {
      return (response.data as List)
          .map((item) => DonorDonationList.fromJson(item))
          .toList();
    } else {
      throw Exception('API request failed: ${response.message}');
    }
  }
}
