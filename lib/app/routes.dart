import 'package:flutter/material.dart';
import 'package:ieatta/core/ui/auth/register_screen.dart';
import 'package:ieatta/core/ui/auth/sign_in_screen.dart';
import 'package:ieatta/core/ui/setting/setting_screen.dart';
import 'package:ieatta/core/ui/splash/splash_screen.dart';
import 'package:ieatta/src/ui/todo/edit/create_edit_restaurant_screen.dart';
import 'package:ieatta/src/ui/todo/todos_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String create_edit_restaurant = '/create_edit_restaurant';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => SignInScreen(),
    register: (BuildContext context) => RegisterScreen(),
    home: (BuildContext context) => TodosScreen(),
    setting: (BuildContext context) => SettingScreen(),
    create_edit_restaurant: (BuildContext context) => CreateEditRestaurantScreen(),
  };
}
