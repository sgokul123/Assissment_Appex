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
  TextEditingController searchController = TextEditingController();
  final _pendingCount = 0.obs;
  BuildContext context;

  HomeScreenController({this.context});

  get pendingCount => this._pendingCount.value;

  set pendingCount(value) => this._pendingCount.value = value;

  final _showPendingPlaceHolder = false.obs;

  get showPendingPlaceHolder => this._showPendingPlaceHolder.value;

  set showPendingPlaceHolder(value) =>
      this._showPendingPlaceHolder.value = value;

  final _completedCount = 0.obs;
  final _isCompletedCalled = false.obs;

  final _showCompletedPlaceHolder = false.obs;

  get showCompletedPlaceHolder => this._showCompletedPlaceHolder.value;

  set showCompletedPlaceHolder(value) =>
      this._showCompletedPlaceHolder.value = value;

  get completedCount => this._completedCount.value;

  set completedCount(value) => this._completedCount.value = value;

  get isCompletedCalled => this._isCompletedCalled.value;

  set isCompletedCalled(value) => this._isCompletedCalled.value = value;

  final _selectedIndex = 0.obs;
  final _showPlaceHolder = false.obs;

  get selectedIndex => this._selectedIndex.value;

  set selectedIndex(value) => this._selectedIndex.value = value;

  get showPlaceHolder => this._showPlaceHolder.value;

  set showPlaceHolder(value) => this._showPlaceHolder.value = value;
  GlobalKey<State> keyChild1 = GlobalKey();

  final _myResultList = List<DataModel>.empty(growable: true).obs;

  get myResultList => this._myResultList.value;

  set myResultList(value) => this._myResultList.assignAll(value);

  @override
  void onInit() {
    Get.lazyPut(() => APIRepository());
    getData();
    super.onInit();
  }

  Future<void> getData() async {}

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
