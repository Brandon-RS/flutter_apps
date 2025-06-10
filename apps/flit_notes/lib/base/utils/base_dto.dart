abstract class BaseDto {
  const BaseDto();

  Map<String, dynamic> toMap();

  bool get isEmpty => toMap().isEmpty;

  bool validate() => !isEmpty;

  @override
  String toString() => toMap().toString();
}
