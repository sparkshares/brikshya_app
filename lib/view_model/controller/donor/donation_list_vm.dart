import 'package:get/get.dart';
import 'package:project_app/data/response/status.dart';
import 'package:project_app/models/donor_donation_list/donor_donation_list.dart';
import 'package:project_app/repository/donor_repository/donor_repository.dart';

class DonorDonationListController extends GetxController {
  final _api = DonorRepository();

  RxString error = "".obs;
  final rxRequestStatus = Status.LOADING.obs;
  final RxList<DonorDonationList> donationList = <DonorDonationList>[].obs;

  void setRxRequestStatus(Status _value) {
    print('Setting status: $_value');
    rxRequestStatus.value = _value;
  }

  double get totalAmount {
    double sum = 0;
    for (var donation in donationList) {
      sum += donation.donationAmount ??
          0; // replace 'amount' with the actual field name in your DonorDonationList model
    }
    return sum;
  }

  int get donationCount => donationList.length;

  void setDonationList(List<DonorDonationList> _value) {
    print('Setting donation list: $_value');
    donationList.value = _value;
  }

  void setError(String _value) {
    print('Setting error: $_value');
    error.value = _value;
  }

  Future<void> donationListApi() {
    print('Fetching donation list');
    return _api.getDonationListApi().then((value) {
      print('Fetched donation list: $value');
      setRxRequestStatus(Status.COMPLETED);
      if (value is List<DonorDonationList>) {
        setDonationList(value);
      } else {
        setError("Data format error");
      }
    }).onError((error, stackTrace) {
      print('Error fetching donation list: $error');
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.getDonationListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      if (value is List<DonorDonationList>) {
        setDonationList(value);
      } else {
        setError("Data format error");
      }
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
