
import 'package:mvvm_project/core/resources/constants/langouage_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:convert' as convert;


const String PREFS_KEY_LANG="PREFS_KEY_LANG";
const String PREFS_KEY_ONBORDING_SCREEN="PREFS_KEY_ONBORDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED_IN="PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_Token="PREFS_KEY_Token";
const String PREFS_KEY_CURRENCY="PREFS_KEY_Currency";
const String PREFS_KEY_Payment_Cookie="Payment_Cookie";




class AppPreferences{

 late SharedPreferences _sharedPreferences;

 AppPreferences(this._sharedPreferences);

 Future<String> getAppLanguage() async{
   String? language=_sharedPreferences.getString(PREFS_KEY_LANG);

   if(language !=null && language.isNotEmpty){

     return language;
   }else{
     return LanguageType.ENGLISH.getValue();
   }
 }
 Future<void> setAppLanguage(String language) async{
   _sharedPreferences.setString(PREFS_KEY_LANG,language);
 }
 Future<String> getAppCurrency() async{
   String? currency=_sharedPreferences.getString(PREFS_KEY_CURRENCY);

   if(currency !=null && currency.isNotEmpty){

     return currency;
   }else{
     return "EGP";
   }
 }

 Future<void> setAppCurrency(String currency) async{
   _sharedPreferences.setString(PREFS_KEY_CURRENCY,currency);
 }

 Future<void> setOnBordingScreenView() async{
     _sharedPreferences.setBool(PREFS_KEY_ONBORDING_SCREEN,true);
 }

 Future<void> setToken(String token) async{
   _sharedPreferences.setString(PREFS_KEY_Token,token);


   // var base64Str =  Uri.encodeFull(token);
   //      print("PREFS_KEY_Payment_Cookie :${base64Str}");
   // _sharedPreferences.setString(PREFS_KEY_Payment_Cookie,"${Cookie_Name}=$base64Str");

 }

 Future<String> getToken() async{
 return _sharedPreferences.getString(PREFS_KEY_Token) ?? "";
 }

 Future<String> getTokenPayment() async{
   return _sharedPreferences.getString(PREFS_KEY_Payment_Cookie) ?? "";
 }
 Future<void> setIsUserLoggedIn(bool setIsUserLoggedIn) async{
   _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN,setIsUserLoggedIn);
 }

 Future<bool> isOnBordingScreenView() async{
  return  _sharedPreferences.getBool(PREFS_KEY_ONBORDING_SCREEN) ?? false;
 }

 Future<bool> isUserLoggedIn() async{
   return  _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
 }
}