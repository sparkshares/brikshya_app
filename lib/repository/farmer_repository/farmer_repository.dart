import 'package:project_app/data/network/network_api_services.dart';
import 'package:project_app/data/response/api_response.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/models/accepted_donation_list/accepted_donation_list.dart';
import 'package:project_app/models/all_donation_list/all_available_donation.dart';
import 'package:project_app/resources/url/app_url.dart';

class FarmerRepository {
  final _apiServices = NetworkApiServices();

  Future<List<AllAvailableDonationList>> getAllAvailableDonationList() async {
    ApiResponse<dynamic> response =
        await _apiServices.getReq(AppUrl.getAllAvailableDonationListApi());

    if (response.status == Status.COMPLETED) {
      return (response.data as List)
          .map((item) => AllAvailableDonationList.fromJson(item))
          .toList();
    } else {
      throw Exception('API request failed: ${response.message}');
    }
  }

  Future<List<AllAcceptedDonationList>> getAllApprovedDonationList() async {
    ApiResponse<dynamic> response =
        await _apiServices.getReq(AppUrl.getAllApprovedDonationApi());

    if (response.status == Status.COMPLETED) {
      return (response.data as List)
          .map((item) => AllAcceptedDonationList.fromJson(item))
          .toList();
    } else {
      throw Exception('API request failed: ${response.message}');
    }
  }

  Future<dynamic> acceptOfferApi(var data) async {
    print("The data is =" + data.toString());
    dynamic response =
        await _apiServices.postReq(data, AppUrl.acceptOfferApi());
    return response;
  }

  Future<dynamic> updateStatusApi(var data, int id) async {
    dynamic response = await _apiServices.postReq(
        data, AppUrl.updateTreeDonationStatusApi(id));
    print("the response is " + response.toString());
    return response;
  }
}
