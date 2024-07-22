import 'dart:io';

import 'package:book_app_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key,
  // this.pickedImage, required this.function
   });
  // final File? pickedImage;
  // final Function function;
  @override
  Widget build(BuildContext context) {
    
    return    Container(
                decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    border: Border.all(
      color: AppColor.primaryColor
    ),
                ),
              );
  }
}