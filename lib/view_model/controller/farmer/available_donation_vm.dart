import 'package:get/get.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/models/all_donation_list/all_available_donation.dart';
import 'package:project_app/repository/farmer_repository/farmer_repository.dart';

class AllAvailableDonationController extends GetxController {
  final _api = FarmerRepository();

  RxString error = "".obs;
  final rxRequestStatus = Status.LOADING.obs;
  final RxList<AllAvailableDonationList> availableDonationList =
      <AllAvailableDonationList>[].obs;

  int get availableDonationCount => availableDonationList.length;
  void setRxRequestStatus(Status _value) {
    print('Setting status: $_value');
    rxRequestStatus.value = _value;
  }

  void setAvailableDonationList(List<AllAvailableDonationList> _value) {
    print('Setting available donation list: $_value');
    availableDonationList.value = _value;
  }

  void setError(String _value) {
    print('Setting error: $_value');
    error.value = _value;
  }

  Future<void> availableDonationListApi() {
    print('Fetching available donation list');
    return _api.getAllAvailableDonationList().then((value) {
      print('Fetched available donation list: $value');
      setRxRequestStatus(Status.COMPLETED);
      if (value is List<AllAvailableDonationList>) {
        setAvailableDonationList(value);
      } else {
        setError("Data format error");
      }
    }).onError((error, stackTrace) {
      print('Error fetching available donation list: $error');
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.getAllAvailableDonationList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      if (value is List<AllAvailableDonationList>) {
        setAvailableDonationList(value);
      } else {
        setError("Data format error");
      }
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
