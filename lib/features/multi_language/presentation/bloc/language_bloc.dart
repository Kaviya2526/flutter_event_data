// application/language_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entites/language.dart';
import '../../domain/usecases/get_languages.dart';
import '../../domain/usecases/get_selected_language.dart';
import '../../domain/usecases/save_language.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetLanguages getLanguages;
  final GetSelectedLanguage getSelectedLanguage;
  final SaveLanguage saveLanguage;

  AppLanguage? selected;

  LanguageBloc(this.getLanguages, this.getSelectedLanguage, this.saveLanguage)
      : super(LanguageInitial()) {
    on<LoadLanguages>(_onLoadLanguages);
    on<SelectLanguage>(_onSelectLanguage);
    on<ConfirmLanguage>(_onConfirmLanguage);
  }

  Future<void> _onLoadLanguages(
      LoadLanguages event, Emitter<LanguageState> emit) async {
    final langs = await getLanguages();
    final savedCode = await getSelectedLanguage();
    selected = langs.firstWhere(
      (l) => l.code == savedCode,
      orElse: () => langs[0],
    );
    emit(LanguageLoaded(langs, selected));
  }

  void _onSelectLanguage(SelectLanguage event, Emitter<LanguageState> emit) {
    selected = event.language;

    final languages = state is LanguageLoaded
        ? (state as LanguageLoaded).languages
        : <AppLanguage>[];

    emit(LanguageLoaded(languages, selected));
  }

  Future<void> _onConfirmLanguage(
      ConfirmLanguage event, Emitter<LanguageState> emit) async {
    if (selected != null) {
      await saveLanguage(selected!.code);
      emit(LanguageSaved(selected!));
    }
  }
}
