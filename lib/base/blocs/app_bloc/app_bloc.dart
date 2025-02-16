import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/enums/app_locales.dart';
import 'package:flit_notes/base/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<LoadAppData>(_onLoadAppData);
    on<ChangeLang>(_onChangeAppLang);
    on<ChangeTheme>(_onChangeTheme);
  }

  Future<void> _onLoadAppData(LoadAppData event, Emitter<AppState> emit) async {
    emit(AppLoading());

    final lang = await AppStorage.instance.lang;
    FlutterNativeSplash.remove();

    emit(AppLoaded(lang: lang));
  }

  Future<void> _onChangeAppLang(
    ChangeLang event,
    Emitter<AppState> emit,
  ) async {
    final lang = await AppStorage.instance.saveLang(event.lang);
    emit(AppLoaded(lang: lang));
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<AppState> emit) async {
    final theme = await AppStorage.instance.saveTheme(event.theme);
    emit(AppThemeChanged(theme: theme));
  }
}
