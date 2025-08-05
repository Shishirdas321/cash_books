import 'dart:async' show Future;
import 'dart:convert';
import 'package:cash_books/features/auth/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


import 'package:shared_preferences/shared_preferences.dart';



import '../../core/utils/app_constants.dart';
import '../../features/auth/model/LoginResponse.dart';
import '../../main.dart';



class Session {
  static late final SharedPreferences _pref;

  static Future<SharedPreferences> init(SharedPreferences pref) async =>
      _pref = pref;

  static String getString(String key, [String? defValue]) {
    return _pref.getString(key) ?? defValue ?? "";
  }

  static List<String> getStringList(String key) {
    return _pref.getStringList(key) ?? [] ;
  }

  static Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _pref.setStringList(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _pref.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _pref.setDouble(key, value);
  }

  ////////// ************* //////////////////

  static Future<bool> saveLang(String? lang) async {
    return await setString("LANGUAGE", lang ?? "en");
  }

  static String getLang() {
    var res = _pref.getString("LANGUAGE") ?? "";
    return res;
  }

  static Future<bool> saveSession(String? userRes) async {
    return await setString(AppConstants.SESSION, userRes ?? "{}");
  }
  static Future<bool> saveUserEmail(String? userRes) async {
    return await setString("USEREMAIL", userRes??"");
  }
  static Future<bool> saveUserPass(String? pass) async {
    return await setString("USERPASS", pass??"");
  }


  static Future<bool> saveSettings(String? settingsRes) async {
    return await setString("SETTINGS", settingsRes ?? "{}");
  }


  static Future<bool> saveToken(String? token) async {
    return await setString("SESSION_TOKEN", token ?? "");
  }

  static Future<bool> saveRefreshToken(String? token) async {
    return await setString("SESSION_REFRESH_TOKEN", token ?? "");
  }

  static Future<bool> saveRole(String role) async {
    return await setString("SESSION_ROLE", role);
  }
  static Future<bool> saveIsRememberMe(bool isRemember) async {
    return await setBool("SESSION_IS_REMEMBER", isRemember);
  }

  static Future<bool> saveUsageDisclosureAccepted(bool isAccepted) async {
    return await setBool("SESSION_USAGE_DISCLOSURE_ACCEPTED", isAccepted);
  }












  static bool getUsageDisclosureAccepted() {
    var res = _pref.getBool("SESSION_USAGE_DISCLOSURE_ACCEPTED") ?? false;
    return res;
  }

  static bool getIsRememberMe() {
    var res = _pref.getBool("SESSION_IS_REMEMBER") ?? false;
    return res;
  }


  static String getUserEmail() {
    var res = _pref.getString("USEREMAIL")??"";
    return res;
  }
  static String getUserPassword() {
    String res = _pref.getString("USERPASS")??"";
    return res;
  }


  static String getToken() {
    var res = _pref.getString("SESSION_TOKEN") ?? "";
    return res;
  }

  static String getRefreshToken() {
    var res = _pref.getString("SESSION_REFRESH_TOKEN") ?? "";
    return res;
  }


  static bool isLoggedOn() {

    return Session.getToken().isNotEmpty;
  }
  // static String getRole() {
  //   return getSession().role ?? "none";
  // }
  //
  // static bool isUser() {
  //   return getSession().role ==AppConstants.USER_ROLE;
  // }

  static User getSession() {
    var res = _pref.getString(AppConstants.SESSION) ?? "{}";
    return userFromJson("$res" == "null" ? "{}" : res);
  }

  static Future<bool> clear() async {
    return _pref.clear();
  }

  static Future<bool> clearSession() async {
    _pref.remove("SESSION_TOKEN");
    _pref.remove(AppConstants.SESSION);
    _pref.remove("SESSION_ROLE");

    return true;
  }

  static Future<void> reload() async {
    return _pref.reload();
  }

  static Future<void> signOut({bool navigateToLogin = true}) async {
                    // unregister

    await clearSession();
    if(navigateToLogin){
      Get.offAll(SignInScreen());
    }






  }

}
