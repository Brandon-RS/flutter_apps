part of 'app_bottom_bar_cubit.dart';

final class AppBottomBarState extends Equatable {
  const AppBottomBarState({this.currentIndex = 0});

  final int currentIndex;

  AppBottomBarState copyWith({int? selectedIndex}) =>
      AppBottomBarState(currentIndex: selectedIndex ?? currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
