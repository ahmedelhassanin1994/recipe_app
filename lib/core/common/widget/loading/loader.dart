import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';

class Loader {

  static Future<void> showLoader(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(elevation: 0, backgroundColor: Colors.transparent, children: <Widget>[
                Center(
                  child: Lottie.asset(JsonAssets.loading, width: MediaQuery.of(context).size.width / 8),
                )
              ]));
        });
  }

 static showSnackBar(BuildContext context, String message) {
    // LoginResponse_Error loginResponse_Error=new LoginResponse_Error.fromJson(json.decode(message));
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static hideLoader(context) {
    Navigator.pop(context);
  }
}
