import 'dart:developer';
import 'package:book_app_task/config/local_db/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'upload_book_state.dart';

class UploadBookCubit extends Cubit<UploadBookState> {
  UploadBookCubit() : super(UploadBookInitial());
  static UploadBookCubit get(context) => BlocProvider.of(context);
  SqlDb sqlDb = SqlDb();

  insertData({
    required String bookName,
    required String bookAuthor,
    required String aboutBook,
    required int bookCopiesBefore,
    required int bookCopiesAfter,
  }) async {
    emit(InsertDataLoadingState());
    try {
      int response = await sqlDb.insertData(
          'INSERT INTO books(bookName, bookAuthor, aboutBook, bookCopiesBefore,bookCopiesAfter) VALUES("$bookName", "$bookAuthor", "$aboutBook", "$bookCopiesBefore","$bookCopiesAfter")');
      emit(InsertDataSuccessState(id: response));
    } catch (error) {
      emit(InsertDataErrorState(error: error.toString()));
    }
  }

  getData() async {
    emit(GetDatabaseLoadingState());
    try {
      var response = await sqlDb.readData('SELECT * FROM books');
      emit(GetDatabaseSuccessState(books: response));
    } catch (error) {
      emit(GetDatabaseErrorState(error: error.toString()));
    }
  }

  updateData(int bookId, int bookCopiesAfter, int bookCopiesBefore,
      String functiontype) async {
    emit(UpdateDatabaseLoadingState());
    try {
      if (functiontype == "Borrow") {
        if (bookCopiesAfter == 0) {
          var response = await sqlDb.updateData(
              'UPDATE books SET bookCopiesAfter = bookCopiesBefore - 1 WHERE id = $bookId');
          emit(UpdateBorrowValueSuccessState(id: response));
        } else if (bookCopiesAfter == 1) {
          var response = await sqlDb.updateData(
              'UPDATE books SET bookCopiesAfter = bookCopiesBefore WHERE id = $bookId');
          emit(UpdateBorrowValueSuccessState(id: response));
        } else if (bookCopiesAfter == bookCopiesBefore) {
           var response = await sqlDb.updateData(
              'UPDATE books SET bookCopiesAfter = bookCopiesBefore WHERE id = $bookId');
          emit(UpdateBorrowValueSuccessState(id: response));
          log("no copies");
        } else {
          var response = await sqlDb.updateData(
              'UPDATE books SET bookCopiesAfter = bookCopiesAfter - 1 WHERE id = $bookId');
          emit(UpdateBorrowValueSuccessState(id: response));
        }
      } else if (functiontype == "Replay") {
        if (bookCopiesAfter >= 0 || bookCopiesBefore > bookCopiesAfter) {
          var response = await sqlDb.updateData(
              'UPDATE books SET bookCopiesAfter = bookCopiesAfter -1 WHERE id = $bookId');
          emit(UpadteReplayValueSuccessState(id: response));
        } else if (bookCopiesAfter == bookCopiesBefore) {
          var response = await sqlDb.updateData(
              'UPDATE books SET bookCopiesAfter = bookCopiesBefore - 1 WHERE id = $bookId');
          emit(UpadteReplayValueSuccessState(id: response));
        }
      }
    } catch (error) {
      emit(UpdateDatabaseErrorState(error: error.toString()));
    }
  }
}


