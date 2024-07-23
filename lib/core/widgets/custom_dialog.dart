import 'package:book_app_task/core/utils/app_color.dart';
import 'package:book_app_task/core/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogAlertFun{
  static Future<void> showMyDialog(
      {required String daliogContent,
      required String actionName,
        bool isSuccess = true,
      required BuildContext context,
      required VoidCallback onTap}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(children: [
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: const Color(0xffEAEAEA),
                    child: Center(
                      child: Icon(
                       isSuccess? Icons.check : Icons.close,

                        size: 40,
                        color:isSuccess? AppColor.primaryColor:Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    daliogContent,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  AppButton(
                    buttonName: actionName,
                    borderRadius: 10,
                    buttonColor:AppColor.primaryColor ,
                  //  buttoncolor: AppColor.primaryColor,
                    height: 52.h,
                    width: 166,
                    white: false,
                    onTap: onTap,
                    textColor: Colors.white,
                  )
                ]),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> imagePickerDialog(
      {required BuildContext context,
      required Function camerFun,
      required Function galeryFun,
      required Function removeFun}) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text("Chose option")),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        camerFun();
                      },
                      icon: const Icon(Icons.camera,color: AppColor.primaryColor,),
                      label: const Text("Camera")),
                  TextButton.icon(
                      onPressed: () {
                        galeryFun();
                      },
                      icon: const Icon(Icons.file_open,color:AppColor.primaryColor),
                      label: const Text("Galery")),
                  TextButton.icon(
                      onPressed: () {
                        removeFun();
                      },
                      icon: const Icon(Icons.remove,color: AppColor.primaryColor,),
                      label: const Text("remove"))
                ],
              ),
            ),
          );
        });
  }
}