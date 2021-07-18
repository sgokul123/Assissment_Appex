import 'package:appex_assignment/src/localisation/generated/locale_base.dart';
import 'package:appex_assignment/src/utils/constants.dart';
import 'package:appex_assignment/src/utils/flutter_toast.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
  FocusNode userNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  final _showPassword = false.obs;
  final _validationAttempt = 0.obs;
  var formKey = GlobalKey<FormState>();

  get showPassword => this._showPassword.value;

  set showPassword(value) => this._showPassword.value = value;

  get validationAttempt => this._validationAttempt.value;

  set validationAttempt(value) => this._validationAttempt.value = value;

  bool customValidation() {
    bool flag = true;
    if (passwordController.text.isEmpty) {
      flag = false;
    } else if (passwordController.text.length < 3 ||
        passwordController.text.length > 10) {
      flag = false;
    }
    return flag;
  }

  bool isValidUser(String userName, String userPass, LocaleMain localizations) {
    if (userName == USER_NAME1) {
      if (userPass == USER_PASSWORD1) {
        return true;
      } else {
        FlutterToast.showToast(localizations.passwordIncorrect);
        return true;
      }
    } else if (userName == USER_NAME2) {
      if (userPass == USER_PASSWORD2) {
        return true;
      } else {
        FlutterToast.showToast(localizations.passwordIncorrect);
        return true;
      }
    } else if (userName == USER_NAME3) {
      if (userPass == USER_PASSWORD3) {
        return true;
      } else {
        FlutterToast.showToast(localizations.passwordIncorrect);
        return true;
      }
    } else {
      FlutterToast.showToast(localizations.userNotExist);
      return false;
    }
  }
}
