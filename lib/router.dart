import 'package:bilimusic/screen/config/config_screen.dart';
import 'package:bilimusic/screen/home/collect_video.dart';
import 'package:bilimusic/screen/home/discover_screen.dart';
import 'package:bilimusic/screen/home/fav_video.dart';
import 'package:bilimusic/screen/local_fav/local_fav_screen.dart';
import 'package:bilimusic/screen/login/login_screen.dart';
import 'package:bilimusic/screen/search/search_screen.dart';
import 'package:bilimusic/screen/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/home/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _browserNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
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
                        GoRoute(
                          path: 'collect',
                          builder: (context, state) {
                            int id = state.extra as int;
                            return CollectVideo(
                              id,
                            );
                          },
                        ),
                        // GoRoute(
                        //   path: 'discover',
                        //   builder: (context, state) => const DiscoverScreen(),
                        // ),
                        GoRoute(
                          path: 'local_fav',
                          builder: (context, state) => const LocalFavScreen(),
                        ),
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
                        GoRoute(
                          path: 'favorite/:id',
                          builder: (context, state) {
                            final id = state.pathParameters['id']!;
                            return FavVideo(
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
