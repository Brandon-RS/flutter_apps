part of 'app_bloc.dart';

@immutable
sealed class AppState extends Equatable {
  const AppState({this.lang = AppLocale.enUS, this.theme = ThemeMode.system});

  final AppLocale lang;
  final ThemeMode theme;

  @override
  List<Object> get props => [lang, theme];
}

final class AppInitial extends AppState {}

final class AppLoading extends AppState {}

final class AppLoaded extends AppState {
  const AppLoaded({super.lang});
}

final class AppThemeChanged extends AppState {
  const AppThemeChanged({super.theme});
}

final class AppError extends AppState {
  const AppError({required this.error});

  final Object error;

  @override
  List<Object> get props => [...super.props, error];
}
