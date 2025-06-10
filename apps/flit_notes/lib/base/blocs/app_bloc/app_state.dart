part of 'app_bloc.dart';

@immutable
class AppState extends Equatable {
  const AppState._({
    this.lang = AppLocale.enUS,
    this.theme = ThemeMode.system,
    this.error = undefined,
    this.status = AppStateStatus.initial,
  });

  const AppState.initial() : this._();

  const AppState.loaded({required AppLocale lang, required ThemeMode theme})
    : this._(lang: lang, theme: theme, status: AppStateStatus.loaded);

  final AppLocale lang;
  final ThemeMode theme;
  final Object error;
  final AppStateStatus status;

  AppState copyWith({
    AppLocale? lang,
    ThemeMode? theme,
    AppStateStatus? status,
  }) => AppState._(
    lang: lang ?? this.lang,
    theme: theme ?? this.theme,
    status: status ?? this.status,
    error: undefined,
  );

  AppState setAppError(Object error) => AppState._(
    lang: lang,
    theme: theme,
    error: error,
    status: AppStateStatus.error,
  );

  @override
  List<Object> get props => [lang, theme, status, error];
}

enum AppStateStatus { initial, loaded, error }
