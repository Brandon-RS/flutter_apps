import 'package:flutter/widgets.dart';
import 'package:savings/base/mixins/injector_mixin.dart';
import 'package:savings/base/presentation/controllers/base_controller.dart';

abstract class StatelessPage<C extends BaseController> extends StatelessWidget with InjectorMixin<C> {
  const StatelessPage({super.key});
}

abstract class PageState<C extends BaseController, P extends StatefulWidget> extends State<P>
    with InjectorInitializerMixin<C, P> {}

abstract class StatefulPage<C extends BaseController> extends StatefulWidget {
  const StatefulPage({super.key});

  String? get tag => null;
  bool get destroyOnDispose => true;
  InjectorType get injectorType => InjectorType.factory;

  Generator<C>? factoryController();

  @override
  PageState<C, StatefulPage<C>> createState() => _StatefulPageState<C>();

  Widget build(BuildContext context, C controller, StateSetter setState);
}

class _StatefulPageState<C extends BaseController> extends PageState<C, StatefulPage<C>> {
  @override
  String? get tag => widget.tag;

  @override
  bool get destroyOnDispose => widget.destroyOnDispose;

  @override
  InjectorType get injectorType => widget.injectorType;

  @override
  Generator<C>? factoryController() => widget.factoryController();

  @override
  Widget build(context) => widget.build(context, controller, setState);
}
