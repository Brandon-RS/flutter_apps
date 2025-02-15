import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/pages/app_layout_page.dart';
import 'package:flit_notes/base/pages/unknown_page.dart';
import 'package:flit_notes/features/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

final routerInstance = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  static AppRouter get to => routerInstance;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: AppLayoutRoute.page,
      path: AppLayoutPage.routePath,
      children: [AutoRoute(path: HomePage.routePath, page: HomeRoute.page)],
    ),
    AutoRoute(path: UnknownPage.routePath, page: UnknownRoute.page),
  ];
}
