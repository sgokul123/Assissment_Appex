import 'package:appex_assignment/src/api/data_client.dart';
import 'package:appex_assignment/src/models/response.dart';
import 'package:appex_assignment/src/utils/custom_logger.dart';
import 'package:appex_assignment/src/utils/network_util.dart';
import 'package:appex_assignment/src/utils/progress_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIRepository {
  void callAPIService(
      {BuildContext context,
      String endpoint,
      bool isHideDialog,
      ApplicationResponseSuccess applicationResponseSuccess,
      ApplicationResponseError applicationResponseError}) async {
    bool isConnected = await NetworkUtil.isNetworkConnected();
    if (isConnected) {
      CustomLogger.log("URL-ENDPOINT === " + endpoint);
      ProgressDialogs.showProgressDialog(context); //invoking login
      String url = "";
      try {
        Response response = await DataClient(url).dio.get(endpoint);
        ProgressDialogs.hideProgressDialog(context); //invoking login
        if (response.statusCode == 200) {
          BaseResponse gatewayResponse = BaseResponse.fromJson(response.data);
          CustomLogger.log("URL-ENDPOINT === ${gatewayResponse.data}");
          applicationResponseSuccess(gatewayResponse);
        }
      } on Exception catch (e) {
        CustomLogger.log("Exception $e");
        ProgressDialogs.hideProgressDialog(context); //invoking login
      }
    }
  }
}

typedef ApplicationResponseSuccess = void Function(BaseResponse response);
typedef ApplicationResponseError = void Function();
