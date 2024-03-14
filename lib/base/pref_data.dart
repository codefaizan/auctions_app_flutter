// import 'package:shared_preferences/shared_preferences.dart';
//
// class PrefData {
//   static String prefName = "com.astute.evcharge";
//
//   static String introAvailable = "${prefName}isIntroAvailable";
//   static String isLoggedIn = "${prefName}isLoggedIn";
//   static String isLocationIn = "${prefName}isLocationIn";
//
//   static Future<SharedPreferences> getPrefInstance() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     return preferences;
//   }
//
//   static setLogIn(bool avail) async {
//     SharedPreferences preferences = await getPrefInstance();
//     preferences.setBool(isLoggedIn, avail);
//   }
//
//   static Future<bool> isLogIn() async {
//     SharedPreferences preferences = await getPrefInstance();
//     bool isIntroAvailable = preferences.getBool(isLoggedIn) ?? false;
//     return isIntroAvailable;
//   }
//
//   static setLocation(bool location) async {
//     SharedPreferences preferences = await getPrefInstance();
//     preferences.setBool(isLocationIn, location);
//   }
//
//   static Future<bool> isLocation() async {
//     SharedPreferences preferences = await getPrefInstance();
//     bool isLocationAvailable = preferences.getBool(isLocationIn) ?? false;
//     return isLocationAvailable;
//   }
// }
