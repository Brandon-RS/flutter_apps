import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savings/base/mixins/injector_mixin.dart';
import 'package:savings/base/presentation/controllers/unknown_controller.dart';
import 'package:savings/base/presentation/pages/base_page.dart';

@RoutePage()
class UnknownPage extends StatefulPage<UnknownController> {
  const UnknownPage({super.key});

  static const String routePath = '/unknown';

  @override
  Generator<UnknownController>? factoryController() =>
      () => UnknownController();

  @override
  Widget build(context, controller, setState) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Page')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Counter: ${controller.counter.value}, Test: ${controller.test}')),
            Text('Counter: ${controller.counter.value}, Test: ${controller.test}'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              controller.counter.value--;
              controller.test++;
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => controller.counter.value++,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

// class UnknownPage extends StatefulWidget {
//   const UnknownPage({super.key});

//   static const String routePath = '/unknown';

//   @override
//   State<UnknownPage> createState() => _UnknownPageState();
// }

// class _UnknownPageState extends PageState<UnknownController, UnknownPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Unknown Page')),
//       body: Center(child: Text('UnknownPage')),
//     );
//   }
// }
