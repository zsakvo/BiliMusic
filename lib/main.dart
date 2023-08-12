import 'dart:io';

import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/router.dart';
import 'package:bilimusic/screen/config/config_screen.dart';
import 'package:bilimusic/utils/play.dart';

import 'package:bilimusic/utils/server.dart';
import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaru_window/yaru_window.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late final SharedPreferences spInstance;
late final PersistCookieJar cookieJar;

void main(List<String> args) async {
  if (runWebViewTitleBarWidget(args)) {
    return;
  }
  WidgetsFlutterBinding.ensureInitialized();
  spInstance = await SharedPreferences.getInstance();
  var cookiePath = "${(await getApplicationSupportDirectory()).path}/.cookies/";
  cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
  if (Platform.isMacOS) {
    await YaruWindow.ensureInitialized();
  }
  final container = ProviderContainer();
  final dir = await getApplicationDocumentsDirectory();
  Isar.openSync(
    [PlayResSchema],
    directory: dir.path,
  );

  BiliServer().init();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await Ajax().init(container);
  await Player().init();
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Platform.isMacOS) {
      final window = YaruWindow.of(context);
      window.hideTitle();
    }
    final colorSeed = ColorThemes[ref.watch(themeColorProvider)];

    return MaterialApp.router(
      title: '哔哩哔哩音乐',
      debugShowCheckedModeBanner: true,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("zh", "CN")],
      theme: ThemeData(
              // fontFamily: 'Harmony',
              colorScheme: ColorScheme.fromSeed(seedColor: colorSeed),
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity)
          .useSystemChineseFont(),
      routerConfig: router,
    );
  }
}
