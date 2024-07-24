import 'dart:developer';

import 'package:book_app_task/Features/upload_books/cubit/upload_book_cubit.dart';
import 'package:book_app_task/Features/upload_books/refactors/upload_book_body.dart';
import 'package:book_app_task/config/local_db/sqldb.dart';
import 'package:book_app_task/config/routes/app_routes.dart';
import 'package:book_app_task/core/extensions/context_extensions.dart';
import 'package:book_app_task/core/helper/spacing.dart';
import 'package:book_app_task/core/shared_pref/shered_pref.dart';
import 'package:book_app_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadBookScreen extends StatefulWidget {
  UploadBookScreen({
    super.key,
  });

  @override
  State<UploadBookScreen> createState() => _UploadBookScreenState();
}

class _UploadBookScreenState extends State<UploadBookScreen> {
  TextEditingController bookNameController = TextEditingController();
  TextEditingController bookAuthorController = TextEditingController();
  TextEditingController aboutBookController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  int bookCopiesBefore = 0;
  void _incrementCounter() {
    setState(() {
      bookCopiesBefore++;
    });
  }

  void _decrementCounter() {
    setState(() {
      bookCopiesBefore--;
    });
  }

  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => UploadBookCubit(),
      child: Scaffold(
        body: BlocConsumer<UploadBookCubit, UploadBookState>(
          listener: (context, state) {
            if (state is InsertDataLoadingState) {
              log('insert  loading');
            } else if (state is InsertDataSuccessState) {
              log(state.id.toString());
              context.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
            } else if (state is InsertDataErrorState) {
              log(state.error);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return UploadBookBody(
              formKey: formkey,
              bookCopies: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColor.primaryColor,
                      border: Border.all(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _incrementCounter();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  horizontalSpacing(20),
                  Text(
                    '$bookCopiesBefore ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  horizontalSpacing(20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColor.primaryColor,
                      border: Border.all(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (bookCopiesBefore <= 0) {
                          return;
                        } else {
                          _decrementCounter();
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  SharedPref.sharedPreferences.setBool('UploadBook', true);
                  debugPrint('${bookNameController.text}');
                  context.read<UploadBookCubit>().insertData(
                      bookName: bookNameController.text,
                      bookAuthor: bookAuthorController.text,
                      aboutBook: aboutBookController.text,
                      bookCopiesBefore: bookCopiesBefore,
                      bookCopiesAfter: 0);
                }
              },
              bookCpoiesBefore: bookCopiesBefore,
              aboutBookController: aboutBookController,
              bookAuthorController: bookAuthorController,
              bookNameController: bookNameController,
            );
          },
        ),
      ),
    ));
  }
}
