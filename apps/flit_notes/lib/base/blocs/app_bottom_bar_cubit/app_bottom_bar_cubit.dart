import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'app_bottom_bar_state.dart';

@singleton
class AppBottomBarCubit extends Cubit<AppBottomBarState> {
  AppBottomBarCubit() : super(const AppBottomBarState());

  void onPageChanged(int index) => emit(state.copyWith(selectedIndex: index));
}
