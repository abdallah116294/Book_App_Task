import 'package:book_app_task/Features/upload_books/screens/upload_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child) {
        return  MaterialApp(
           debugShowCheckedModeBanner: false,
          home:  UploadBookScreen(),
        );
      }
    );
  }
}