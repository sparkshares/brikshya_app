class AppUrl {
  static const String baseUrl = "http://192.168.18.41:8000";
  // Users App Endpoints
  static String registerApi() => '$baseUrl/api/user/register/';
  static String makeDonationApi() => '$baseUrl/api/app/donate/';
  static String getDonationListApi() => '$baseUrl/api/app/donations/';
  static String getFirebaseDataApi() => '$baseUrl/api/app/get-firebase-data/';

  static String loginApi() => '$baseUrl/api/user/login/';
  static String userProfileApi() => '$baseUrl/api/user/profile/';
  static String editProfileApi() => '$baseUrl/api/user/profile/edit/';
  static String changePasswordApi() => '$baseUrl/api/user/change-password/';
  static String refreshTokenApi() => '$baseUrl/api/user/token/refresh/';
  static String getAllAvailableDonationListApi() =>
      '$baseUrl/api/app/list-all-donation/';

  static String getAllApprovedDonationApi() =>
      '$baseUrl/api/app/list-accept-donation/';
  static String updateTreeDonationStatusApi(int id) =>
      '$baseUrl/api/app/update-tree-donation-status/$id/';
  static String acceptOfferApi() => '$baseUrl/api/app/accept-donation/';
}
