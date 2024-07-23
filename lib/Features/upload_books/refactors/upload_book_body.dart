import 'package:book_app_task/Features/upload_books/widgets/chanage_lang_button.dart';
import 'package:book_app_task/Features/upload_books/widgets/pick_image_widget.dart';
import 'package:book_app_task/Features/upload_books/widgets/text_form_field_widget.dart';
import 'package:book_app_task/app/cubit/app_cubit_cubit.dart';
import 'package:book_app_task/core/extensions/context_extensions.dart';
import 'package:book_app_task/core/helper/spacing.dart';
import 'package:book_app_task/core/localization/lang_keys.dart';
import 'package:book_app_task/core/utils/animations.dart';
import 'package:book_app_task/core/utils/app_color.dart';
import 'package:book_app_task/core/widgets/app_buttons.dart';
import 'package:book_app_task/core/widgets/custom_dialog.dart';
import 'package:book_app_task/core/widgets/titles_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadBookBody extends StatefulWidget {
  UploadBookBody(
      {super.key,
      required this.bookNameController,
      required this.bookAuthorController,
      required this.aboutBookController,
      required this.bookCpoiesBefore,required this.onTap, required this.bookCopies});
  final TextEditingController bookNameController;
  final TextEditingController bookAuthorController;
  final TextEditingController aboutBookController;
  int bookCpoiesBefore;
  VoidCallback onTap;
 final Widget bookCopies; 
  @override
  State<UploadBookBody> createState() => _UploadBookBodyState();
}

class _UploadBookBodyState extends State<UploadBookBody> {
  //int widget.BookCpoiesBefore  = 0;
    XFile? _pickedImage;
  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await DialogAlertFun.imagePickerDialog(
        context: context,
        camerFun: () async {
          _pickedImage = await picker.pickImage(source: ImageSource.camera);
          setState(() {});
        },
        galeryFun: () async {
          _pickedImage = await picker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        removeFun: () {
          setState(() {
            _pickedImage = null;
          });
        });
  }
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChangeLang(onTap: (){
              context.read<AppCubitCubit>().toggleLanguage();
            }),
            verticalSpacing(20),
             Center(
                child: TitlesTextWidget(
              label: context.translate(LangKeys.uploadBook),
              color: AppColor.text,
            )),
            verticalSpacing(20),
                    SizedBox(
                    height: size.width * 0.3,
                    width: size.width * 0.3,
                    child: PickImageWidget(
                      pickedImage: _pickedImage,
                      function: () {
                        localImagePicker();
                      },
                    ),
                  ),
            verticalSpacing(20),
            Form(
                child: Column(
              children: [
                CustomTextFormFiled(
                  controller: widget.bookNameController,
                  inputFiled: context.translate(LangKeys.bookName),
                ),
                verticalSpacing(20),
                CustomTextFormFiled(
                  controller: widget.bookAuthorController,
                  inputFiled:context.translate(LangKeys.bookAuthor),
                ),
                verticalSpacing(20),
                CustomTextFormFiled(
                  controller: widget.aboutBookController,
                  inputFiled: context.translate(LangKeys.aboutBook),
                ),
                verticalSpacing(20),
                 TitlesTextWidget(label: context.translate(LangKeys.copies)),
                 verticalSpacing(20),
                Center(
child:widget.bookCopies ,
                ),
                verticalSpacing(20),
                CustomFadeInRight(
                  duration: 600,
                  child: AppButton(
                      buttonColor: AppColor.primaryColor,
                      width: double.infinity - 20,
                      height: 60,
                      buttonName: context.translate(LangKeys.uploadBook),
                      onTap: widget.onTap,
                      textColor: Colors.white,
                      white: true),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
