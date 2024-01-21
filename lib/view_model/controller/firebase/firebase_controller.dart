import 'package:get/get.dart';
import 'package:project_app/models/firebase_data/firebase_data.dart';
import 'package:project_app/repository/firebase_repository/firebase_repository.dart';

class FirebaseLiveDataController extends GetxController {
  final _api = FirebaseRepository();

  RxString error = "".obs;
  final Rx<FirebaseData?> liveData = Rx<FirebaseData?>(null);

  void setLiveData(FirebaseData? _value) {
    print('Setting live data: $_value');
    liveData.value = _value;
  }

  void setError(String _value) {
    print('Setting error: $_value');
    error.value = _value;
  }

  void refreshApi() {
    _api.getFirebaseData().then((value) {
      setLiveData(value);
    }).catchError((error) {
      setError(error.toString());
    });
  }
}
