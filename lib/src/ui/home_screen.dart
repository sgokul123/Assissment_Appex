import 'dart:io';

import 'package:appex_assignment/src/controller/home_screen_controller.dart';
import 'package:appex_assignment/src/localisation/generated/locale_base.dart';
import 'package:appex_assignment/src/ui/login_screen.dart';
import 'package:appex_assignment/src/utils/custom_color.dart';
import 'package:appex_assignment/src/utils/dialog_util.dart';
import 'package:appex_assignment/src/utils/locales_strings.dart';
import 'package:appex_assignment/src/utils/shared_preference_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSceen extends StatelessWidget {
  LocaleMain _localizations;

  @override
  Widget build(BuildContext context) {
    _localizations = LocalesString(context).localizations;
    Get.lazyPut<HomeScreenController>(
        () => HomeScreenController(context: context));
    return WillPopScope(
      onWillPop: () {
        onBackPress(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: CustomColor.screenBackgroundColor,
        body: GetX<HomeScreenController>(
            initState: (state) =>
                Get.find<HomeScreenController>().callApiToFetchData(context),
            builder: (_controller) {
              return (_controller.myResultList != null &&
                      _controller.myResultList.length > 0)
                  ? Padding(
                      padding: EdgeInsets.all(10.5),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.storage),
                                  onPressed: () {
                                    onBackPress(context, false);
                                  }),
                              Text(
                                _localizations.flyingWolf,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Spacer(),
                              Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      onBackPress(context, true);
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      size: 26.0,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 15.0, top: 15.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      _controller.myResultList[0].cover_url ??
                                          "https://cdn.game.tv/game-tv-content/images_3/92ecf377c625d26f9021a60bfe9a0614/Banners.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _localizations.displayName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(fontSize: 25),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.blueAccent,
                                                  style: BorderStyle.solid)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "2344",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4
                                                      .copyWith(
                                                          color: Colors
                                                              .blueAccent),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  _localizations.eloRating,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
                            child: Container(
                                height: 100,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0)),
                                          color: CustomColor.orange,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "29",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        color: Colors.white70),
                                              ),
                                              Text(
                                                _localizations.tournamentPlayed,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        color: Colors.white70),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        decoration: BoxDecoration(
                                          color: CustomColor.deepPurple,
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(10.5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "29",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      .copyWith(
                                                          color:
                                                              Colors.white70),
                                                ),
                                                Text(
                                                  _localizations.tournamentWon,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      .copyWith(
                                                          color:
                                                              Colors.white70),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0)),
                                          color: CustomColor.redOrange,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "29%",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        color: Colors.white70),
                                              ),
                                              Text(
                                                _localizations
                                                    .winningPercentage,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .copyWith(
                                                        color: Colors.white70),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              _localizations.recommendadForYou,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontSize: 30),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _controller.myResultList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Card(
                                      elevation: 4.0,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(15.0)),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 100,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(15.0)),
                                                child: Image.network(
                                                  _controller
                                                          .myResultList[index]
                                                          .cover_url ??
                                                      "https://cdn.game.tv/game-tv-content/images_3/92ecf377c625d26f9021a60bfe9a0614/Banners.jpg",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            _controller
                                                                .myResultList[
                                                                    index]
                                                                ?.name,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6,
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            _controller
                                                                .myResultList[
                                                                    index]
                                                                ?.game_name,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6
                                                                .copyWith(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 25.0,
                                                    color: CustomColor
                                                        .borderDarkGrey,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ],
                      ),
                    )
                  : _controller.showPlaceHolder ?? false
                      ? Container(
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                "No result found for search key",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                        )
                      : SizedBox();
            }),
      ),
    );
  }

  void onBackPress(BuildContext context, bool isLogout) {
    DialogUtil.showCustomDialog(
        context: context,
        strMessage:
            isLogout ? _localizations.logoutScreen : _localizations.leaveScreen,
        onAlertDialogOptionSelected: () async {
          if (isLogout) {
            await Get.find<HomeScreenController>()
                .encryptedSharedPreferences
                .setString(SharedPreferenceKeys.IS_LOGGED_IN, "false");
            Get.to(() => LoginScreen());
          } else {
            exit(0);
          }
        });
  }
}
