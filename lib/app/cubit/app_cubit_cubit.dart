import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_cubit_state.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(SelectedLocale(const Locale("en"))) {
    _loadSavedLanguage();
  }
  void toArabic() {
    emit(SelectedLocale(Locale('ar')));
    _saveLanguagePreference('ar');
  }
  void toEnglish() {
    emit(SelectedLocale(Locale('en')));
    _saveLanguagePreference('en');
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('selected_language');
    if (languageCode != null) {
      emit(SelectedLocale(Locale(languageCode)));
    }
  }
  Future<void> _saveLanguagePreference(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', languageCode);
  }

  void toggleLanguage() {
    final currentLocale = state is SelectedLocale ? (state as SelectedLocale).locale : Locale('en');
    if (currentLocale.languageCode == 'en') {
      emit(SelectedLocale(Locale('ar')));
      _saveLanguagePreference('ar');
    } else {
      emit(SelectedLocale(Locale('en')));
      _saveLanguagePreference('en');
    }
  }
    Alignment getAlignment() {
    return state.locale.languageCode == 'ar' ? Alignment.topRight : Alignment.topLeft;
  }
}
