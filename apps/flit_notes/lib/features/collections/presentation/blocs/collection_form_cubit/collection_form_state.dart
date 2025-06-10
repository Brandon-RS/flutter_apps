part of 'collection_form_cubit.dart';

enum CollectionFormStatus {
  editing,
  loading,
  success,
  error;

  bool get isError => this == CollectionFormStatus.error;
  bool get isLoading => this == CollectionFormStatus.loading;
  bool get isSuccess => this == CollectionFormStatus.success;
}

class CollectionFormState extends Equatable {
  const CollectionFormState({
    this.id,
    this.name = '',
    this.description,
    this.icon,
    this.color,
    this.status = CollectionFormStatus.editing,
  });

  const CollectionFormState.initial()
    : id = null,
      name = '',
      description = null,
      icon = null,
      color = null,
      status = CollectionFormStatus.editing;

  final String? id;
  final String name;
  final String? description;
  final String? icon;
  final Color? color;
  final CollectionFormStatus status;

  CollectionFormState copyWith({
    String? name,
    String? description,
    String? icon,
    Color? color,
    CollectionFormStatus? status,
  }) {
    return CollectionFormState(
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      status: status ?? this.status,
    );
  }

  CollectionFormState setValue({
    String? name,
    String? description,
    String? icon,
    Color? color,
  }) {
    return copyWith(
      name: name,
      description: description,
      icon: icon,
      color: color,
      status: CollectionFormStatus.editing,
    );
  }

  CreateCollectionDto toDto() {
    return CreateCollectionDto(
      name: name,
      description: description,
      icon: icon,
      color: color?.toString(), // TODO(BRANDOM): Fix this
    );
  }

  bool validate() => toDto().validate();

  @override
  List<Object?> get props => [name, description, icon, color, status];
}
