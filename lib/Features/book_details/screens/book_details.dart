import 'package:book_app_task/Features/book_details/widgets/book_info_widget.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.data
      // required this.title,
      // required this.imagePath,
      // required this.supTitle,
      // this.supTitle2
      });
  // final String title;
  // final String imagePath;
  // final String supTitle;
  // final String? supTitle2;
  final Map<String, dynamic> data;
  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      bookAuthor: widget.data["bookAuthor"],
      copiesAfter: widget.data['bookCopiesAfter'],
      bookId: widget.data['id'],
      copies: widget.data['bookCopiesBefore'],
      title: widget.data['bookName'],
      supTitle: widget.data['bookAuthor'],
      aboutBook: widget.data['aboutBook'],
    );
  }
}
