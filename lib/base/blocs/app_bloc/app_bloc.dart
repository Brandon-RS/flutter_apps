import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'app_event.dart';
part 'app_state.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._storage) : super(AppInitial()) {
    on<LoadAppData>(_loadAppData);
    on<ChangeAppLocale>(_onAppLocaleChanged);
    on<AppErrorOccurred>(_onAppErrorOccurred);
  }

  final FlutterSecureStorage _storage;

  Future<void> _loadAppData(
    LoadAppData event,
    Emitter<AppState> emit,
  ) async {
    FlutterNativeSplash.remove();
    // TODO(BRANDOM): Get the saved locale from storage and set it to the state

    // TODO(BRANDOM): Extract key to a constant
    final deviceId = await _storage.read(key: 'device_id');

    if (deviceId != null) {
      emit(AppLoaded(deviceId));
      return;
    }

    final newDeviceId = const Uuid().v4();
    await _storage.write(key: 'device_id', value: newDeviceId);
    emit(AppLoaded(newDeviceId));
  }

  void _onAppLocaleChanged(
    ChangeAppLocale event,
    Emitter<AppState> emit,
  ) {
    emit(AppLoaded(
      (state as AppLoaded).appId,
      locale: event.locale,
    ));
  }

  void _onAppErrorOccurred(
    AppErrorOccurred event,
    Emitter<AppState> emit,
  ) {
    emit(AppError(event.error));
  }
}
