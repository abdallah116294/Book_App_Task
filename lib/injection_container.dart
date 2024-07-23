import 'package:book_app_task/config/local_db/sqldb.dart';
import 'package:get_it/get_it.dart';
import 'package:book_app_task/Features/upload_books/cubit/upload_book_cubit.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //cubit
  sl.registerFactory(() => UploadBookCubit());
  //sqflite
  sl.registerLazySingleton(() => SqlDb());

}
