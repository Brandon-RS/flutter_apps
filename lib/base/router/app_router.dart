import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/presentation/pages/app_layout_page.dart';
import 'package:flit_notes/base/presentation/pages/app_theme_test_page.dart';
import 'package:flit_notes/base/presentation/pages/unknown_page.dart';
import 'package:flit_notes/features/collections/presentation/pages/collections_page.dart';
import 'package:flit_notes/features/library/presentation/layouts/library_layout_page.dart';
import 'package:flit_notes/features/library/presentation/pages/library_page.dart';
import 'package:flit_notes/features/notes/presentation/pages/notes_page.dart';
import 'package:flit_notes/features/quick_find/presentation/pages/quick_find_page.dart';
import 'package:flit_notes/features/settings/presentation/pages/settings_page.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  static AppRouter get instance => appRouter;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: AppLayoutRoute.page,
      path: AppLayoutPage.routePath,
      children: [
        CustomRoute(
          initial: true,
          path: LibraryLayoutPage.routePath,
          page: LibraryLayoutRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          children: [
            CustomRoute(
              path: LibraryPage.routePath,
              page: LibraryRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: CollectionsPage.routePath,
              page: CollectionsRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: NotesPage.routePath,
              page: NotesRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        ),
        CustomRoute(
          path: QuickFindPage.routePath,
          page: QuickFindRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: SettingsPage.routePath,
          page: SettingsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
      ],
    ),
    AutoRoute(path: AppThemeTestPage.routePath, page: AppThemeTestRoute.page),
    AutoRoute(path: UnknownPage.routePath, page: UnknownRoute.page),
  ];
}
