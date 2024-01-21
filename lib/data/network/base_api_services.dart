import 'package:project_app/data/response/api_response.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  Future<ApiResponse> getReq(String url);
  Future<ApiResponse> postReq(dynamic data, String url);
  Future<ApiResponse> putReq(dynamic data, String url);
  Future<ApiResponse> deleteReq(String url);
  Future<ApiResponse> postMultipart(http.MultipartRequest request);
}
