import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';

part 'add_button_state.dart';

class AddButtonCubit extends Cubit<AddButtonState> {
  AddButtonCubit() : super(AddButtonState.close());

  void toggle() {
    emit(state.isOpen ? AddButtonState.close() : AddButtonState.open());
  }

  void instantClose() {
    emit(AddButtonState.close(duration: Duration.zero));
  }
}
