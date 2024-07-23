part of 'app_cubit_cubit.dart';

@immutable
abstract class AppCubitState {
  final Locale locale;
  AppCubitState(this.locale);
}

class SelectedLocale extends AppCubitState {
  SelectedLocale(Locale locale) : super(locale);
}
// sealed class AppCubitState {}

// final class AppCubitInitial extends AppCubitState {}
/*
abstract class AppCubitState {
  final Locale locale;
  AppCubitState(this.locale);
}

class SelectedLocale extends LocaleState {
  SelectedLocale(Locale locale) : super(locale);
}
*/