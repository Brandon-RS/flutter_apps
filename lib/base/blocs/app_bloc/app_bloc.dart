import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/constants/sdk_helpers.dart';
import 'package:flit_notes/base/enums/app_locales.dart';
import 'package:flit_notes/base/extensions/app_storage_ext.dart';
import 'package:flit_notes/base/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<LoadAppData>(_onLoadAppData);
    on<ChangeLang>(_onChangeAppLang);
    on<ChangeTheme>(_onChangeTheme);
    on<OnAppError>(_onAppError);
  }

  Future<void> _onLoadAppData(LoadAppData event, Emitter<AppState> emit) async {
    emit(
      AppState.loaded(
        lang: AppStorage.instance.lang,
        theme: AppStorage.instance.theme,
      ),
    );

    Future.delayed(250.asMilliseconds, () => FlutterNativeSplash.remove());
  }

  Future<void> _onChangeAppLang(
    ChangeLang event,
    Emitter<AppState> emit,
  ) async {
    final lang = await AppStorage.instance.saveLang(event.lang);
    emit(state.copyWith(lang: lang));
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<AppState> emit) async {
    final theme = await AppStorage.instance.saveTheme(event.theme);
    emit(state.copyWith(theme: theme));
  }

  void _onAppError(OnAppError event, Emitter<AppState> emit) {
    emit(state.setAppError(event.error));
  }
}
