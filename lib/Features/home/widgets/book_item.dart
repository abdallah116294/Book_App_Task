import 'package:book_app_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/widgets/titles_text_widget.dart';

class BookItem extends StatelessWidget {
  //final String imagePath;
  final String title;
  final void Function()? onTap;

  const BookItem({
    super.key,
   // required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 0.0)
                  ]),
              child: Icon(Icons.book,size: 180,color: AppColor.primaryColor,)),
          verticalSpacing(5),
          TitlesTextWidget(fontSize: 14, label: title)
        ],
      ),
    );
  }
}