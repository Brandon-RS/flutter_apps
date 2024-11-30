import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'app_event.dart';
part 'app_state.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._storage) : super(AppInitial()) {
    on<AppIdChanged>(_setUpAppId);
    on<AppErrorOccurred>(_onAppErrorOccurred);
  }

  final FlutterSecureStorage _storage;

  Future<void> _setUpAppId(
    AppIdChanged event,
    Emitter<AppState> emit,
  ) async {
    FlutterNativeSplash.remove();

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

  void _onAppErrorOccurred(
    AppErrorOccurred event,
    Emitter<AppState> emit,
  ) {
    emit(AppError(event.error));
  }
}
