import 'package:book_app_task/app/bloc_observer.dart';
import 'package:book_app_task/app/my_app.dart';
import 'package:book_app_task/core/shared_pref/shered_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
   await di.init();
   await SharedPref().instantiatePreferences();
    Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}



