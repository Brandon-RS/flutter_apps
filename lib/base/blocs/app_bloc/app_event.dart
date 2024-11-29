part of 'app_bloc.dart';

@immutable
sealed class AppEvent {
  const AppEvent();
}

final class AppIdChanged extends AppEvent {
  const AppIdChanged();
}

final class AppErrorOccurred extends AppEvent {
  const AppErrorOccurred(this.error);

  final Object error;
}
