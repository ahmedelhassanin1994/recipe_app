

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/common/app_settings/userAuthState.dart';
import 'package:mvvm_project/core/common/data/model/langouage.dart';
import 'package:mvvm_project/core/common/data/model/model_currency.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';


class AppSettings extends ChangeNotifier{

 late AppPreferences sharedPreferences;


 AppSettings(this.sharedPreferences);
 UserAuthState state = AuthInitialState();
  late bool isAuthUser=false;
  late String Language='';
 late String currency='';
 late String token='';
 late String token_payment='';



 List<ModelLangouage> langList=[];
 List<Model_Currency> currencyList=[];

 @override
 void start() {
  // TODO: implement start
  ListLangouage();
  getAppLanguage();
  getAppCurrency();
  ListCurrency();
  IsAuth();
  state=AuthInitialState();
 }


 Future<void> IsAuth()async {

  try{
   sharedPreferences.isUserLoggedIn().then((isUserLoginIn)async{

    if(isUserLoginIn){
      token=await sharedPreferences.getToken();

      // token_payment=await sharedPreferences.getTokenPayment();
     state = UserISAuthState(token.toString());
     isAuthUser=true;
     notifyListeners();



    }else{
     state = UserISNotAuthState();
     isAuthUser=false;

     notifyListeners();
   }
   });
  }catch(e){
   state = UserISNotAuthState();
   isAuthUser=false;
   notifyListeners();
  }
 }

 Future<void> exit()async {

  sharedPreferences.setIsUserLoggedIn(false);
  sharedPreferences.setToken('');
  isAuthUser=false;
  state = UserISNotAuthState();
  notifyListeners();
 }

 Future<String> getAppLanguage()async {

  Language =await sharedPreferences.getAppLanguage();
  notifyListeners();
  return Language;
 }
 Future<void> setAppLanguage(String language_) async {
  await sharedPreferences.setAppLanguage(language_);
  Language=language_;
  notifyListeners();
 }

 Future<void> setAppCurrency(String currency_,BuildContext context) async {
  // context.setLocale(Locale("$Language}"));
  await sharedPreferences.setAppCurrency(currency_);
  currency=currency_;
  notifyListeners();
 }
 Future<String> getAppCurrency()async {

  currency =await sharedPreferences.getAppCurrency();
  notifyListeners();
  return Language;
 }


 Future<void> ListLangouage() async {
  final String response = await rootBundle.loadString('${JsonAssets.languagesInfo}');
  langList.clear();
  final data = await json.decode(response);
  final list= data.map((data) => ModelLangouage.fromJson(data)).toList();
  for(ModelLangouage m in list){
   langList.add(m);
  }
  notifyListeners();

 }
 Future<void> ListCurrency() async {
  final String response = await rootBundle.loadString('${JsonAssets.currency}');
  currencyList.clear();
  final data = await json.decode(response);
  final list= data.map((data) => Model_Currency.fromJson(data)).toList();
  for(Model_Currency m in list){
   currencyList.add(m);
  }
  notifyListeners();
 }
 }

