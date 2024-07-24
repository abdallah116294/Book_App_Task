import 'package:book_app_task/Features/upload_books/cubit/upload_book_cubit.dart';
import 'package:book_app_task/Features/upload_books/screens/upload_book_screen.dart';
import 'package:book_app_task/app/cubit/app_cubit_cubit.dart';
import 'package:book_app_task/config/routes/app_routes.dart';
import 'package:book_app_task/core/localization/app_localization_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.startWidget});
  final String startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocProvider(
            create: (context) => AppCubitCubit(),
            child: BlocBuilder<AppCubitCubit, AppCubitState>(
              builder: (context, state) {
                if (state is SelectedLocale) {
                  return MaterialApp(
                    locale: state.locale,
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    initialRoute:startWidget,
                    debugShowCheckedModeBanner: false,
                    home: UploadBookScreen(),
                  );
                }
                return Container();
              },
            ),
          );
        });
  }
}
