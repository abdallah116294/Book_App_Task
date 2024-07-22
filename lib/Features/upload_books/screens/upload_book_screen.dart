import 'package:book_app_task/Features/upload_books/refactors/upload_book_body.dart';
import 'package:flutter/material.dart';

class UploadBookScreen extends StatelessWidget {
   UploadBookScreen({super.key});
   TextEditingController bookNameController = TextEditingController();
     TextEditingController bookAuthorController=TextEditingController();
     TextEditingController aboutBookController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child:  Scaffold(
        body: UploadBookBody(
          aboutBookController: aboutBookController,
          bookAuthorController: bookAuthorController,
          bookNameController:bookNameController ,
        ),
      ),
    );
  }
}