part of 'app_bloc.dart';

@immutable
sealed class AppEvent {
  const AppEvent();
}

final class LoadAppData extends AppEvent {
  const LoadAppData();
}

final class AppErrorOccurred extends AppEvent {
  const AppErrorOccurred(this.error);

  final Object error;
}

final class ChangeAppLocale extends AppEvent {
  const ChangeAppLocale(this.locale);

  final Locale locale;
}
