import 'dart:developer';

import 'package:book_app_task/Features/upload_books/cubit/upload_book_cubit.dart';
import 'package:book_app_task/app/cubit/app_cubit_cubit.dart';
import 'package:book_app_task/config/routes/app_routes.dart';
import 'package:book_app_task/core/extensions/context_extensions.dart';
import 'package:book_app_task/core/localization/lang_keys.dart';
import 'package:book_app_task/core/widgets/app_buttons.dart';
import 'package:book_app_task/core/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/text_styles.dart';

class InfoWidget extends StatefulWidget {
  final String title;
  // final String imagePath;
  final String supTitle;
  final String? aboutBook;
  int? copies;
  final bookId;
  int copiesAfter;
  final String bookAuthor;

  InfoWidget(
      {super.key,
      required this.title,
      // required this.imagePath,
      required this.copiesAfter,
      required this.supTitle,
      this.aboutBook,
      required this.bookId,
      this.copies,
      required this.bookAuthor});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    int copiesBefore = widget.copies!;
    return BlocProvider(
      create: (context) => UploadBookCubit(),
      child: BlocConsumer<UploadBookCubit, UploadBookState>(
        listener: (context, state) {
          if (state is UpdateDatabaseLoadingState) {
            log('loading ');
          } else if (state is UpdateBorrowValueSuccessState) {
            log("Success state " + state.id.toString());
            if (widget.copiesAfter == widget.copies!) {
              DialogAlertFun.showMyDialog(
                  daliogContent: context.translate(LangKeys.no_copies),
                  actionName: context.translate(LangKeys.go_back),
                  context: context,
                  onTap: () {
                    context.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
                  });
            } else {
              DialogAlertFun.showMyDialog(
                  daliogContent:
                      context.translate(LangKeys.borrow_book_success),
                  actionName: context.translate(LangKeys.go_home),
                  context: context,
                  onTap: () {
                    context.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
                  });
            }
          } else if (state is UpadteReplayValueSuccessState) {
            if (widget.copiesAfter == 0) {
              DialogAlertFun.showMyDialog(
                  daliogContent: context.translate(LangKeys.no_returns),
                  actionName: context.translate(LangKeys.go_back),
                  context: context,
                  onTap: () {
                    context.pop();
                  });
            } else if (widget.copiesAfter > 0 &&
                widget.copiesAfter < widget.copies!) {
              DialogAlertFun.showMyDialog(
                  daliogContent:
                      context.translate(LangKeys.return_book_success),
                  actionName: context.translate(LangKeys.go_home),
                  context: context,
                  onTap: () {
                    context.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
                  });
            } else if (widget.copiesAfter == widget.copies!) {
              DialogAlertFun.showMyDialog(
                  daliogContent: context.translate(LangKeys.return_book_success),
                  actionName: context.translate(LangKeys.go_back),
                  context: context,
                  onTap: () {
                    context.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
                  });
            }
          } else if (state is UpdateDatabaseErrorState) {
            log(state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpacing(20),
                      Text(
                        widget.title,
                        style: TextStyles.font22MoveW700,
                      ),
                      verticalSpacing(30),
                      Icon(Icons.book,
                          size: 150.sp, color: AppColor.primaryColor),
                      Text(
                        '${context.translate(LangKeys.by)}:${widget.bookAuthor}',
                        style: TextStyles.font17BlackW500.copyWith(
                            fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                      verticalSpacing(20),
                      BlocBuilder<AppCubitCubit, AppCubitState>(
                        builder: (context, state) {
                          final alignment =
                              context.read<AppCubitCubit>().getAlignment();
                          return Align(
                            alignment: alignment,
                            child: Text(
                              "    ${context.translate(LangKeys.bookName)}:",
                              style: TextStyle(
                                  color: AppColor.text,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      ),
                      verticalSpacing(10),
                      Container(
                        width: 343.h,
                        height: 110.h,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                              style: TextStyles.font17BlackW500.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                              widget.title),
                        ),
                      ),
                      verticalSpacing(10),
                      BlocBuilder<AppCubitCubit, AppCubitState>(
                        builder: (context, state) {
                          final alignment =
                              context.read<AppCubitCubit>().getAlignment();
                          return Align(
                            alignment: alignment,
                            child: Text(
                              "     ${context.translate(LangKeys.aboutBook)}:",
                              style: TextStyle(
                                  color: AppColor.text,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      ),
                      verticalSpacing(10),
                      Container(
                        width: 343.h,
                        height: 110.h,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                              style: TextStyles.font17BlackW500.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                              widget.aboutBook!),
                        ),
                      ),
                      verticalSpacing(10),
                      BlocBuilder<AppCubitCubit, AppCubitState>(
                        builder: (context, state) {
                          final alignment =
                              context.read<AppCubitCubit>().getAlignment();
                          return Align(
                            alignment: alignment,
                            child: Text(
                              "     ${context.translate(LangKeys.copies)}:",
                              style: TextStyle(
                                  color: AppColor.text,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      ),
                      verticalSpacing(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.copies == widget.copiesAfter
                              ? Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColor.primaryColor,
                                    border: Border.all(),
                                  ),
                                  child: Center(
                                    child: Text(widget.copies.toString(),
                                        style: TextStyles.font17BlackW500
                                            .copyWith(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white)),
                                  ))
                              : Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColor.primaryColor,
                                    border: Border.all(),
                                  ),
                                  child: Center(
                                      child: Text(
                                    widget.copiesAfter == 0
                                        ? widget.copies.toString()
                                        : widget.copiesAfter.toString(),
                                    style: TextStyles.font17BlackW500.copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )),
                                ),
                          horizontalSpacing(10),
                          Text(
                            context.translate(LangKeys.copies),
                            style: TextStyles.font17BlackW500.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                      verticalSpacing(100),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppButton(
                              buttonColor: AppColor.primaryColor,
                              width: 120,
                              height: 60,
                              buttonName:
                                  context.translate(LangKeys.borrow_book),
                              onTap: () {
                                BlocProvider.of<UploadBookCubit>(context)
                                    .updateData(
                                        widget.bookId,
                                        widget.copiesAfter,
                                        widget.copies!,
                                        "Borrow");
                                log(widget.copiesAfter.toString());
                              },
                              textColor: AppColor.text,
                              white: true),
                          AppButton(
                              buttonColor: AppColor.primaryColor,
                              width: 100,
                              height: 60,
                              buttonName:
                                  context.translate(LangKeys.return_book),
                              onTap: () {
                                BlocProvider.of<UploadBookCubit>(context)
                                    .updateData(
                                        widget.bookId,
                                        widget.copiesAfter,
                                        widget.copies!,
                                        "Replay");
                              },
                              textColor: AppColor.text,
                              white: false),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
