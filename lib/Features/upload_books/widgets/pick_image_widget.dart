import 'dart:io';

import 'package:book_app_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.pickedImage, required this.function});
  final XFile? pickedImage;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: pickedImage == null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(),
                    ),
                  )
                : Image.file(
                    File(
                      pickedImage!.path,
                    ),
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        Center(
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColor.primaryColor,
            child: InkWell(
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {
                function();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}