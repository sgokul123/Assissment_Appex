import 'package:appex_assignment/src/api/api_repository.dart';
import 'package:appex_assignment/src/models/dataModel.dart';
import 'package:appex_assignment/src/models/response.dart';
import 'package:appex_assignment/src/utils/custom_logger.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
  BuildContext context;

  HomeScreenController({this.context});

  final _myResultList = List<DataModel>.empty(growable: true).obs;

  get myResultList => this._myResultList.value;

  set myResultList(value) => this._myResultList.assignAll(value);
  final _showPlaceHolder = false.obs;

  get showPlaceHolder => this._showPlaceHolder.value;

  set showPlaceHolder(value) => this._showPlaceHolder.value = value;

  @override
  void onInit() {
    Get.lazyPut(() => APIRepository());
    super.onInit();
  }

  @override
  void onClose() {
    print("onClose onClose");
    super.onClose();
  }

  @override
  void dispose() {
    print("onClose onClose");
    super.dispose();
  }

  callApiToFetchData(BuildContext context) {
    if (myResultList == null || myResultList.length < 1) {
      this.showPlaceHolder = true;
      String endPoint =
          "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all";
      APIRepository _apiRepository = Get.find();
      _apiRepository.callAPIService(
          context: context,
          endpoint: endPoint,
          applicationResponseSuccess: (BaseResponse response) {
            List tempList = List<DataModel>.empty(growable: true).obs;
            tempList = response.data.tournaments;
            this.myResultList = tempList;
            this.showPlaceHolder = false;
            CustomLogger.log("URL-ENDPOINT === ${tempList.length}");
          },
          applicationResponseError: () {});
    }
  }
}
