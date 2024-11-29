import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/resources/resources.dart';
import 'package:flutter/material.dart';

enum BlocStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == BlocStatus.initial;
  bool get isLoading => this == BlocStatus.loading;
  bool get isSuccess => this == BlocStatus.success;
  bool get isError => this == BlocStatus.error;

  Widget build({
    required Widget Function() onSuccess,
    Widget Function()? onInitial,
    Widget Function()? onLoading,
    Widget Function()? onError,
  }) {
    // TODO(BRANDOM): Build default widgets
    return switch (this) {
      BlocStatus.initial => onInitial?.call() ?? const SizedBox.shrink(),
      BlocStatus.loading => onLoading?.call() ?? Center(child: const CircularProgressIndicator()),
      BlocStatus.success => onSuccess(),
      BlocStatus.error => onError?.call() ?? Text(Resources.I.appContext!.localizations.error),
    };
  }
}
