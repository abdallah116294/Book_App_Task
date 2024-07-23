import 'dart:developer';
import 'package:book_app_task/Features/home/widgets/book_item.dart';
import 'package:book_app_task/Features/upload_books/cubit/upload_book_cubit.dart';
import 'package:book_app_task/app/cubit/app_cubit_cubit.dart';
import 'package:book_app_task/config/routes/app_routes.dart';
import 'package:book_app_task/core/extensions/context_extensions.dart';
import 'package:book_app_task/core/helper/spacing.dart';
import 'package:book_app_task/core/localization/lang_keys.dart';
import 'package:book_app_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Database database=MyDatabase();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => context.read<AppCubitCubit>().toggleLanguage(),
            child: Container(
              height: 40.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColor.primaryColor,
                border: Border.all(),
              ),
              child: Center(
                child: Text(context.translate(LangKeys.len),style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ),
      ),
     floatingActionButton: FloatingActionButton(
      backgroundColor: AppColor.primaryColor,
        onPressed: () {
          context.pushName(AppRoutes.uploadBookScreen);
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      body: BlocProvider(
        create: (context) => UploadBookCubit()..getData(),
        child: BlocConsumer<UploadBookCubit, UploadBookState>(
          listener: (context, state) {
            if (state is GetDatabaseLoadingState) {
              log("loading");
            } else if (state is GetDatabaseSuccessState) {
              log("message:" + state.books.toString());
            } else {
              log("error");
            }
          },
          builder: (context, state) {
            if (state is GetDatabaseLoadingState) {
              return const Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            } else if (state is GetDatabaseSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacing(20),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: SizedBox(
                          height: 800.h,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.books.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    context.pushName(
                                        AppRoutes.bookDetailsScreen,
                                        arguments: {
                                          'bookName': state.books[index]
                                              ['bookName'],
                                          'bookAuthor': state.books[index]
                                              ['bookAuthor'],
                                          'aboutBook': state.books[index]
                                              ['aboutBook'],
                                          "bookCopiesBefore": state.books[index]
                                              ['bookCopiesBefore'],
                                          "id": state.books[index]['id'],
                                          "bookCopiesAfter": state.books[index]
                                              ["bookCopiesAfter"],
                                          // "bookAuthor":state.books[index]['bookAuthor']
                                        });
                                  },
                                  child: BookItem(
                                      title: state.books[index]['bookName']));
                              //return infoList[index];
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: .78),
                          ),
                        ))
                  ],
                ),
              );
            } else {
              return const Column(
                children: [
                  Center(
                    child: Text("error"),
                  ),
                ],
              );
            }
          },
        ),
      ),
     
     );
  }
}
