import 'dart:developer';

import 'package:flutter/material.dart';

abstract class BaseController {
  String get tag => runtimeType.toString();

  WidgetsBinding get _binding => WidgetsBinding.instance;

  @mustCallSuper
  void onInit() {
    log('Initialized', name: tag);

    _binding.addPostFrameCallback((_) => onReady());
  }

  @mustCallSuper
  void onReady() {
    log('Ready', name: tag);
  }

  @mustCallSuper
  void onClose() {
    log('Closed', name: tag);
  }

  @mustCallSuper
  void onDestroy() {
    log('Destroyed', name: tag);
  }

  @mustCallSuper
  void onError(Object error, StackTrace stackTrace) {
    log('Error: $error', name: tag, error: error, stackTrace: stackTrace);
  }
}
