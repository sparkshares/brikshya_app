import 'package:get/get.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/models/accepted_donation_list/accepted_donation_list.dart';
import 'package:project_app/repository/farmer_repository/farmer_repository.dart';

class AllApprovedDonationController extends GetxController {
  final _api = FarmerRepository();

  RxString error = "".obs;
  final rxRequestStatus = Status.LOADING.obs;
  final RxList<AllAcceptedDonationList> approvedDonationList =
      <AllAcceptedDonationList>[].obs;

  int get approvedDonationCount => approvedDonationList.length;

  double get totalDonationAmount {
    return approvedDonationList.fold(
        0, (sum, item) => sum + item.donationAmount!);
  }

  void setRxRequestStatus(Status _value) {
    print('Setting status: $_value');
    rxRequestStatus.value = _value;
  }

  void setApprovedDonationList(List<AllAcceptedDonationList> _value) {
    print('Setting approved donation list: $_value');
    approvedDonationList.value = _value;
  }

  void setError(String _value) {
    print('Setting error: $_value');
    error.value = _value;
  }

  Future<void> approvedDonationListApi() {
    print('Fetching approved donation list');
    return _api.getAllApprovedDonationList().then((value) {
      print('Fetched approved donation list: $value');
      setRxRequestStatus(Status.COMPLETED);
      if (value is List<AllAcceptedDonationList>) {
        setApprovedDonationList(value);
      } else {
        setError("Data format error");
      }
    }).onError((error, stackTrace) {
      print('Error fetching approved donation list: $error');
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.getAllApprovedDonationList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      if (value is List<AllAcceptedDonationList>) {
        setApprovedDonationList(value);
      } else {
        setError("Data format error");
      }
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
