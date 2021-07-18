import 'dart:io';

import 'package:appex_assignment/src/api/api_repository.dart';
import 'package:appex_assignment/src/controller/login_screen_controller.dart';
import 'package:appex_assignment/src/localisation/generated/locale_base.dart';
import 'package:appex_assignment/src/ui/home_screen.dart';
import 'package:appex_assignment/src/utils/custom_color.dart';
import 'package:appex_assignment/src/utils/locales_strings.dart';
import 'package:appex_assignment/src/utils/shared_preference_keys.dart';
import 'package:appex_assignment/src/widgets/input_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LocaleMain _localizations;

  @override
  Widget build(BuildContext context) {
    _localizations = LocalesString(context).localizations;
    Get.lazyPut(() => APIRepository());
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        backgroundColor: CustomColor.appPrimaryColor,
        body: GetX<LoginScreenController>(
            initState: (state) => Get.find<LoginScreenController>(),
            builder: (_controller) {
              return Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      child: Form(
                        key: _controller.formKey,
                        autovalidateMode: _controller.validationAttempt == 0
                            ? AutovalidateMode.disabled
                            : AutovalidateMode.always,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Image(
                                image:
                                    AssetImage("assets/images/ic_game_tv.png"),
                                width: MediaQuery.of(context).size.width / 3.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InputFieldArea(
                                hint: _localizations.userName,
                                obscure: false,
                                textEditingController:
                                    _controller.userNameController,
                                maxLength: 10,
                                minLength: 3,
                                error: _localizations.userNameError,
                                textAction: TextInputAction.next,
                                onValueChanged: (newValue) {},
                                onFieldError: (newFocus) {},
                                firstFocus: _controller.userNode,
                                nextFocus: _controller.passwordNode,
                                inputType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InputFieldArea(
                                  hint: _localizations.password,
                                  obscure: _controller.showPassword,
                                  textEditingController:
                                      _controller.passwordController,
                                  maxLength: 10,
                                  minLength: 3,
                                  textAction: TextInputAction.done,
                                  error: _localizations.passwordError,
                                  onValueChanged: (newValue) {},
                                  onKeyBoardKeyEvent: (event) {
                                    if (event == TextInputAction.done) {
                                      if (_controller.formKey.currentState
                                          .validate()) {
                                        if (_controller.isValidUser(
                                            _controller.userNameController.text,
                                            _controller.passwordController.text,
                                            _localizations)) {
                                          Get.to(() => HomeSceen());
                                          _controller.encryptedSharedPreferences
                                              .setString(
                                                  SharedPreferenceKeys
                                                      .IS_LOGGED_IN,
                                                  "true");
                                        }
                                      }
                                      _controller.validationAttempt =
                                          _controller.validationAttempt + 1;
                                    }
                                  },
                                  onFieldError: (newFocus) {},
                                  inputType: TextInputType.text,
                                  firstFocus: _controller.passwordNode,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: _controller.showPassword
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      _controller.showPassword =
                                          !_controller.showPassword;
                                    },
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: ElevatedButton(
                                child: Text(_localizations.login),
                                onPressed: () {
                                  if (_controller.formKey.currentState
                                      .validate()) {
                                    if (_controller.isValidUser(
                                        _controller.userNameController.text,
                                        _controller.passwordController.text,
                                        _localizations)) {
                                      Get.to(() => HomeSceen());
                                      _controller.encryptedSharedPreferences
                                          .setString(
                                              SharedPreferenceKeys.IS_LOGGED_IN,
                                              "true");
                                    }
                                  }
                                  _controller.validationAttempt =
                                      _controller.validationAttempt + 1;
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: CustomColor.deepPurple,
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
