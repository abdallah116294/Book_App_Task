import 'package:book_app_task/Features/upload_books/widgets/pick_image_widget.dart';
import 'package:book_app_task/Features/upload_books/widgets/text_form_field_widget.dart';
import 'package:book_app_task/core/helper/spacing.dart';
import 'package:book_app_task/core/utils/app_color.dart';
import 'package:book_app_task/core/widgets/app_buttons.dart';
import 'package:book_app_task/core/widgets/titles_text_widget.dart';
import 'package:flutter/material.dart';

class UploadBookBody extends StatefulWidget {
  const UploadBookBody({super.key, required this.bookNameController, required this.bookAuthorController,required this.aboutBookController});
  final TextEditingController bookNameController;
   final TextEditingController bookAuthorController;
    final TextEditingController aboutBookController;
  @override
  State<UploadBookBody> createState() => _UploadBookBodyState();
}

class _UploadBookBodyState extends State<UploadBookBody> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            verticalSpacing(20),
            const Center(
                child: TitlesTextWidget(
              label: "Upload Books 📚",
              color: AppColor.text,
            )),
            verticalSpacing(20),

          // const   PickImageWidget(),
           verticalSpacing(20),
            Form(
                child: Column(
              children: [
                CustomTextFormFiled(
                  controller: widget.bookNameController,
                  inputFiled: "Book Name",
                ),
                verticalSpacing(20),
                CustomTextFormFiled(
                  controller: widget.bookAuthorController,
                  inputFiled: "Book Author",
                ),
                verticalSpacing(20),
                CustomTextFormFiled(
                  controller: widget.aboutBookController,
                  inputFiled: "About Book",
                ),
                verticalSpacing(20),
                const TitlesTextWidget(label: 'Book Copies'),
                verticalSpacing(20),
                Row(
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
                      '$_counter',
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
                          if (_counter <= 0) {
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
                verticalSpacing(20),
                AppButton(buttonColor: AppColor.primaryColor, width:double.infinity-20, height: 60, buttonName: "Upload", onTap: (){}, textColor: Colors.white, white: true)
              ],
            )),
          ],
        ),
      ),
    );
  }
}
