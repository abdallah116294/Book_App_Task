import 'package:book_app_task/core/localization/app_localization.dart';
import 'package:flutter/material.dart';

extension ContextEx on BuildContext{
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }
 String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }
  void pop() => Navigator.of(this).pop();

}