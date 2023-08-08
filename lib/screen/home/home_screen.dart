import 'dart:io';

import 'package:bilimusic/api/ajax.dart';

import 'package:bilimusic/api/home_api.dart';
import 'package:bilimusic/api/wbi.dart';
import 'package:bilimusic/components/app_top_bar/app_top_bar_component.dart';
import 'package:bilimusic/components/app_top_bar/provider.dart';
import 'package:bilimusic/components/play_list/play_list.dart';
import 'package:bilimusic/components/player/player.dart';
import 'package:bilimusic/main.dart';

import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/config/config_provider.dart';
import 'package:bilimusic/screen/home/user_dialog.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  drawerGo(BuildContext context, path) {
    if (GoRouter.of(context).location != path) {
      context.go(path);
      Future(() {
        ref.read(topbarStateProvider.notifier).clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final navInfo = ref.watch(navInfoProvider);
    final selectedPageIndex = useState(0);
    final filterKeys = ref.watch(filterKeysProvider);
    final filterBlack = ref.watch(filterBlackProvider);
    // final playerDetailController = ref.watch(playerDetailControllerProvider);
    var mid = ref.watch(navInfoProvider.select((value) => value?.data.mid));
    final folders = useFuture(
        useMemoized(
            () => HomeApi.getFavFolderList(mid).then((folders) {
                  final hitList = [];
                  for (var folder in folders) {
                    if (filterBlack) {
                      if (filterKeys
                          .where((element) => folder.title.contains(element))
                          .isEmpty) {
                        hitList.add(folder);
                      }
                    } else {
                      if (filterKeys
                          .where((element) => folder.title.contains(element))
                          .isNotEmpty) {
                        hitList.add(folder);
                      }
                    }
                  }
                  return hitList;
                }),
            [mid, filterKeys, filterBlack]),
        initialData: []);
    return Stack(children: [
      Scaffold(
          key: ref.watch(homeScaffoldKey),
          drawerScrimColor: Colors.transparent,
          endDrawer: const PlayList(),
          body: SafeArea(
            child: Row(
              children: [
                SizedBox(
                    width: 240,
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 0.7,
                            margin: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 52, 16, 0),
                                    child: Transform.translate(
                                      offset: const Offset(-64, 0),
                                      child: Icon(
                                        const IconData(0xe725,
                                            fontFamily: "Icon"),
                                        size: 36,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        28, 36, 16, 28),
                                    child: InkWell(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: navInfo?.data.isLogin != true
                                          ? Row(
                                              children: [
                                                ClipOval(
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        'https://static.hdslb.com/images/akari.jpg',
                                                    width: 56,
                                                    height: 56,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(children: [
                                              ClipOval(
                                                child: CachedNetworkImage(
                                                  imageUrl: navInfo!.data.face!,
                                                  width: 56,
                                                  height: 56,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 3),
                                                      child: Text(
                                                        navInfo.data.uname!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      "assets/svg/lv${navInfo.data.levelInfo!.currentLevel}.svg",
                                                      width: 10,
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      onTap: () async {
                                        if (navInfo?.data.isLogin != true) {
                                          if (Platform.isLinux ||
                                              Platform.isWindows ||
                                              Platform.isMacOS) {
                                            WebviewWindow.clearAll();
                                            final webview =
                                                await WebviewWindow.create();
                                            webview.setApplicationNameForUserAgent(
                                                "Chrome/114.0.0.0 Safari/537.36");
                                            webview.launch(
                                                "https://passport.bilibili.com/login");
                                            webview.addOnUrlRequestCallback(
                                                (url) async {
                                              Log.e(url);
                                              if (url.startsWith(
                                                  "https://passport.bilibili.cn/x/passport-login")) {
                                                Ajax()
                                                    .get(
                                                        url.replaceAll(
                                                            "bilibili.cn",
                                                            "bilibili.com"),
                                                        options: Options(
                                                            headers: {
                                                              "Referer":
                                                                  "https://passport.bilibili.com/"
                                                            },
                                                            followRedirects:
                                                                false,
                                                            validateStatus:
                                                                (status) {
                                                              return true;
                                                            }))
                                                    .then((value) {
                                                  webview.close();
                                                  WbiSign.getWbiKeys(ref);
                                                });
                                              }
                                            });
                                          } else {
                                            context.go("/login");
                                          }
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: const UserDialog(),
                                                actions: <Widget>[
                                                  FilledButton(
                                                      style: FilledButton
                                                          .styleFrom(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 16,
                                                                horizontal: 24),
                                                        backgroundColor: Theme
                                                                .of(context)
                                                            .colorScheme
                                                            .error, // 使用主题中定义的错误颜色
                                                        side: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .error), // 设置边框颜色为错误颜色
                                                      ),
                                                      child: const Text('退出登录'),
                                                      onPressed: () async {
                                                        await cookieJar
                                                            .deleteAll();
                                                        WbiSign.getWbiKeys(ref);
                                                        // ignore: use_build_context_synchronously
                                                        Navigator.of(context)
                                                            .pop();
                                                      }),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                    )),
                                Expanded(
                                  child: NavigationDrawer(
                                      selectedIndex: selectedPageIndex.value,
                                      elevation: 0.7,
                                      onDestinationSelected: (value) {
                                        selectedPageIndex.value = value;
                                        if (value >= 2) {
                                          drawerGo(context,
                                              "/browser/favorite/${folders.data![value - 2].id}");
                                        } else {
                                          if (value == 0) {
                                            drawerGo(context, "/browser");
                                          } else if (value == 1) {
                                            drawerGo(
                                                context, "/browser/local_fav");
                                          }
                                        }
                                      },
                                      children: <Widget>[
                                        const NavigationDrawerDestination(
                                          label: Text(
                                            "发现",
                                          ),
                                          icon: Icon(Icons.explore_outlined),
                                          selectedIcon: Icon(Icons.explore),
                                        ),
                                        const NavigationDrawerDestination(
                                          label: Text("本地收藏"),
                                          icon: Icon(Icons.lightbulb_outline),
                                          selectedIcon: Icon(Icons.lightbulb),
                                        ),
                                        if (folders.data!.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 16, 16, 14),
                                            child: GestureDetector(
                                              child: Text(
                                                '云端收藏',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                            .withOpacity(0.6),
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                        ...folders.data!.map(
                                            (e) => NavigationDrawerDestination(
                                                  label: Text(e.title),
                                                  icon: const Icon(IconData(
                                                      0xe75a,
                                                      fontFamily: 'Icon')),
                                                  selectedIcon: const Icon(
                                                      IconData(0xe75a,
                                                          fontFamily: 'Icon')),
                                                )),
                                        SizedBox.fromSize(
                                          size: const Size(0, 46),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                        )
                      ],
                    )),
                Expanded(
                    child: Column(
                  children: [
                    const AppTopBar(),
                    Expanded(child: widget.navigationShell),
                    Container(
                      height: 80,
                    )
                  ],
                ))
              ],
            ),
          )),
      const Positioned(
        bottom: 0,
        left: 0,
        child: MusicPlayer(),
      ),
    ]);
  }
}

final homeScaffoldKey = StateProvider((ref) => GlobalKey<ScaffoldState>());
