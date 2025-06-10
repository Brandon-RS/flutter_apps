part of 'add_button_cubit.dart';

class AddButtonState extends Equatable {
  const AddButtonState._({required this.duration, this.isOpen = false});

  factory AddButtonState.close({
    Duration duration = const Duration(milliseconds: 200),
  }) => AddButtonState._(duration: duration);

  factory AddButtonState.open({
    Duration duration = const Duration(milliseconds: 200),
  }) => AddButtonState._(isOpen: true, duration: duration);

  final bool isOpen;
  final Duration duration;

  double get position => isOpen ? 80 : kPaddingHorizontal;

  @override
  List<Object> get props => [isOpen];
}
