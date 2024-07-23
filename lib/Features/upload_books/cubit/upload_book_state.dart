part of 'upload_book_cubit.dart';

@immutable
sealed class UploadBookState {}

final class UploadBookInitial extends UploadBookState {}
class InsertDataLoadingState extends UploadBookState {}
class InsertDataSuccessState extends UploadBookState {
  final int id;
  InsertDataSuccessState({required this.id });
}
class InsertDataErrorState extends UploadBookState {
  final String error;
  InsertDataErrorState({required this.error });
}
class GetDatabaseLoadingState extends UploadBookState {}
class GetDatabaseSuccessState extends UploadBookState {
  final List<Map> books;
  GetDatabaseSuccessState({required this.books });
}
class GetDatabaseErrorState extends UploadBookState {
  final String error;
  GetDatabaseErrorState({required this.error });
}
class UpdateDatabaseLoadingState extends UploadBookState {}
class UpdateBorrowValueSuccessState extends UploadBookState {
  final int id;
  UpdateBorrowValueSuccessState({required this.id });
}
class UpadteReplayValueSuccessState extends UploadBookState {
  final int id;
  UpadteReplayValueSuccessState({required this.id });
}
class UpdateDatabaseSuccessState extends UploadBookState {
  final int id;
  UpdateDatabaseSuccessState({required this.id });
}
class  UpdateDatabaseErrorState extends UploadBookState {
  final String error;
  UpdateDatabaseErrorState({required this.error });
}

