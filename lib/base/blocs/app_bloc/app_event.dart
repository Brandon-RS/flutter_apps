part of 'app_bloc.dart';

@immutable
sealed class AppEvent {
  const AppEvent();
}

final class LoadAppData extends AppEvent {}

final class ChangeLang extends AppEvent {
  const ChangeLang(this.lang);

  final AppLocale lang;
}
