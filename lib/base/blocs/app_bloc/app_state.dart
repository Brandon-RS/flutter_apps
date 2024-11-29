part of 'app_bloc.dart';

@immutable
sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class AppLoading extends AppState {}

final class AppLoaded extends AppState {
  const AppLoaded(this.appId);

  final String appId;

  @override
  List<Object> get props => [appId];
}

final class AppError extends AppState {
  const AppError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
