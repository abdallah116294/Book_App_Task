import 'package:book_app_task/core/extensions/context_extensions.dart';
import 'package:book_app_task/core/localization/lang_keys.dart';
import 'package:book_app_task/core/utils/animations.dart';
import 'package:book_app_task/core/utils/app_color.dart';
import 'package:book_app_task/core/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key, required this.onTap});
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInLeft(
      duration: 400,
      child: AppButton(
          buttonColor: AppColor.primaryColor,
          width:100 ,
          height: 60,
          buttonName: context.translate(LangKeys.language),
          onTap: onTap,
          textColor: Colors.white,
          white: true),
    );
  }
}
