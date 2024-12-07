import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/pages/app_layout_page.dart';
import 'package:flit_notes/base/pages/unknown_page.dart';
import 'package:flit_notes/features/home/presentation/pages/home_page.dart';
import 'package:flit_notes/features/notes/presentation/pages/note_details_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppLayoutRoute.page,
          path: appLayoutPath,
          initial: true,
          children: [
            AutoRoute(path: basePath, page: HomeRoute.page, initial: true),
            AutoRoute(page: NoteDetailsRoute.page, path: idPath),
            AutoRoute(path: '*', page: UnknownRoute.page),
          ],
        ),
      ];

  // generic route paths
  static const String appLayoutPath = '/';
  static const String basePath = 'n';
  static const String idPath = ':id';
}
