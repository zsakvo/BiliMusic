import 'dart:io';

import 'package:bilimusic/screen/home/home_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'home_screen_desktop.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen(this.navigationShell, {super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop =
        Platform.isLinux || Platform.isMacOS || Platform.isWindows;
    return isDesktop
        ? HomeDesktopScreen(navigationShell)
        : const HomeMobileScreen();
  }
}
