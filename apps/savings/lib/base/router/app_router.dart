import 'package:auto_route/auto_route.dart';
import 'package:savings/base/presentation/pages/app_layout_page.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  static AppRouter get instance => appRouter;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [AutoRoute(initial: true, page: AppLayoutRoute.page, path: AppLayoutPage.routePath)];
}
