import 'package:bilimusic/screen/config/config_screen.dart';
import 'package:bilimusic/screen/home/discover_screen.dart';
import 'package:bilimusic/screen/home/home_screen.dart';
import 'package:bilimusic/screen/home/home_screen_mobile.dart';
import 'package:bilimusic/screen/login/login_screen.dart';
import 'package:bilimusic/screen/play_list/play_list_screen.dart';
import 'package:bilimusic/screen/search/search_mobile_page_screen.dart';
import 'package:bilimusic/screen/search/search_mobile_screen.dart';
import 'package:bilimusic/screen/search/search_screen.dart';
import 'package:bilimusic/screen/user/user_screen.dart';
import 'package:bilimusic/utils/misc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _browserNavigatorKey = GlobalKey<NavigatorState>();

final desktopRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/browser',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomeScreen(navigationShell);
          },
          branches: [
            StatefulShellBranch(
                navigatorKey: _browserNavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                      path: "/browser",
                      builder: (context, state) => const DiscoverScreen(),
                      routes: [
                        // GoRoute(
                        //   path: 'collect',
                        //   builder: (context, state) {
                        //     int id = state.extra as int;
                        //     return CollectVideo(
                        //       id,
                        //     );
                        //   },
                        // ),
                        // GoRoute(
                        //   path: 'discover',
                        //   builder: (context, state) => const DiscoverScreen(),
                        // ),
                        // GoRoute(
                        //   path: 'local_fav',
                        //   builder: (context, state) => const LocalFavScreen(),
                        // ),
                        GoRoute(
                          path: 'search/:keyword',
                          builder: (context, state) {
                            final keyword = state.pathParameters['keyword']!;
                            return SearchScreen(
                              keyword,
                              key: GlobalObjectKey(keyword),
                            );
                          },
                        ),
                        // GoRoute(
                        //   path: 'favorite/:id',
                        //   builder: (context, state) {
                        //     final id = state.pathParameters['id']!;
                        //     return FavVideo(
                        //       id,
                        //       key: GlobalObjectKey(id),
                        //     );
                        //   },
                        // ),
                        GoRoute(
                          path: 'play_list/:type/:id',
                          builder: (context, state) {
                            final type = state.pathParameters['type']!;
                            final id = int.parse(state.pathParameters['id']!);
                            return PlayListScreen(
                              type,
                              id,
                              key: GlobalObjectKey(id),
                            );
                          },
                        ),
                        GoRoute(
                          path: 'user/:id',
                          builder: (context, state) {
                            final mid = state.pathParameters['id']!;
                            return UserScreen(
                              mid,
                              key: GlobalObjectKey(mid),
                            );
                          },
                        ),
                        GoRoute(
                            path: "config",
                            builder: (context, state) => const ConfigScreen()),
                      ]),
                ])
          ]),
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
    ]);

final mobileRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(path: "/", builder: (context, state) => const HomeMobileScreen()),
  GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
  GoRoute(
      path: "/search",
      builder: (context, state) => const SearchMobilePageScreen()),
  GoRoute(
      path: "/search_result/:keyword",
      builder: (context, state) {
        final keyword = state.pathParameters['keyword']!;
        return SearchMobileScreen(keyword);
      }),
  GoRoute(
    path: '/play_list/:type/:id/:title',
    builder: (context, state) {
      final type = state.pathParameters['type']!;
      final id = int.parse(state.pathParameters['id']!);
      final title = state.pathParameters['title'];
      return PlayListScreen(
        type,
        id,
        title: title,
        key: GlobalObjectKey(id),
      );
    },
  ),
]);

final router = MiscUtil.isDesktop() ? desktopRouter : mobileRouter;
