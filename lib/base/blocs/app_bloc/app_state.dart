part of 'app_bloc.dart';

@immutable
sealed class AppState extends Equatable {
  const AppState({this.locale = const Locale('en')});

  final Locale locale;

  @override
  List<Object> get props => [locale];
}

final class AppInitial extends AppState {}

final class AppLoading extends AppState {}

final class AppLoaded extends AppState {
  const AppLoaded(this.appId, {super.locale});

  final String appId;

  @override
  List<Object> get props => [...super.props, appId];
}

final class AppError extends AppState {
  const AppError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
