import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/di/di_entry_point.dart';
import 'package:flit_notes/features/collections/data/dtos/create_collection_dto.dart';
import 'package:flit_notes/features/collections/domain/repos/collections_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

part 'collection_form_state.dart';

class CollectionFormCubit extends Cubit<CollectionFormState> {
  CollectionFormCubit()
    : _repo = getIt<CollectionsRepo>(),
      super(const CollectionFormState.initial());

  final CollectionsRepo _repo;

  void setName(String name) {
    emit(state.setValue(name: name));
  }

  void setDescription(String? description) {
    emit(state.setValue(description: description));
  }

  void setIcon(String? icon) {
    emit(state.setValue(icon: icon));
  }

  void setColor(Color? color) {
    emit(state.setValue(color: color));
  }

  void setStatus(CollectionFormStatus status) {
    emit(state.copyWith(status: status));
  }

  void reset() {
    emit(const CollectionFormState.initial());
  }

  // TODO(BRANDOM): Separate this into private calls, one for create and one for update
  // and maybe remove the dto of sate and create them an the method
  Future<void> save() async {
    if (state.status == CollectionFormStatus.loading) return;

    emit(state.copyWith(status: CollectionFormStatus.loading));

    if (state.id.isNullOrEmpty) {
      final response = await _repo.createCollection(state.toDto());

      response.when(
        success: (_) {
          emit(state.copyWith(status: CollectionFormStatus.success));
        },
        failure: (_) {
          emit(state.copyWith(status: CollectionFormStatus.error));
        },
      );
    }
  }
}
