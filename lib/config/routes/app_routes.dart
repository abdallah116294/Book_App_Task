import 'package:book_app_task/Features/book_details/screens/book_details.dart';
import 'package:book_app_task/Features/home/screen/home_scree.dart';
import 'package:book_app_task/Features/upload_books/refactors/upload_book_body.dart';
import 'package:book_app_task/Features/upload_books/screens/upload_book_screen.dart';
import 'package:book_app_task/config/routes/base_routes.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AppRoutes {
  static const String uploadBookScreen = "UploadBookScreen";
  static const String homeScreen = "HomeScreen";
  static const String bookDetailsScreen = "BookDetailsScreen";

  static Route<void>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    // final Database database;
    switch (settings.name) {
      case uploadBookScreen:
        return BaseRoute(page: UploadBookScreen());
      case homeScreen:
        return BaseRoute(page: const HomeScreen());
      case bookDetailsScreen:
        return BaseRoute(page:  BookDetails(data: args as Map<String, dynamic>,));
    }
  }
}
