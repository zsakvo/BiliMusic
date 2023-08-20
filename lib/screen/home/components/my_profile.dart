import 'package:bilimusic/api/user_api.dart';
import 'package:bilimusic/main.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/config/config_provider.dart';
import 'package:bilimusic/screen/config/config_screen.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfileComponent extends StatefulHookConsumerWidget {
  const MyProfileComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyProfileComponentState();
}

class _MyProfileComponentState extends ConsumerState<MyProfileComponent> {
  @override
  Widget build(BuildContext context) {
    final navInfo = ref.watch(navInfoProvider);
    final filterBlack = ref.watch(filterBlackProvider);
    final showSuffixIcon = useState(false);
    final controller = useTextEditingController();
    final navStat = useFuture(useMemoized(() => UserApi.navStat()),
        initialData: {"following": 0, "follower": 0, "dynamic_count": 0});
    final levelValue = useMemoized(() {
      if (navInfo == null) return 0.0;
      if (navInfo.data.levelInfo!.nextExp == "--") return 1.0;
      return navInfo.data.levelInfo!.currentExp /
              navInfo.data.levelInfo!.nextExp is String
          ? double.parse(navInfo.data.levelInfo!.nextExp)
          : navInfo.data.levelInfo!.nextExp * 1.0;
    }, []);
    final statusBarHeight = MediaQuery.of(context).padding.top;

    useEffect(() {
      controller.addListener(() {
        if (controller.text.isNotEmpty) {
          showSuffixIcon.value = true;
        } else {
          showSuffixIcon.value = false;
        }
      });
      return () {};
    }, [controller]);
    return EasyRefresh(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.only(
              left: 16, top: statusBarHeight + 24, bottom: 16, right: 16),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ClipOval(
              child: CachedNetworkImage(
                width: 64,
                height: 64,
                imageUrl: navInfo?.data.face ??
                    'https://static.hdslb.com/images/akari.jpg',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          navInfo?.data.uname ?? "未登录",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      if (navInfo != null)
                        SvgPicture.asset(
                          "assets/svg/lv${navInfo.data.levelInfo!.currentLevel}.svg",
                          width: 12,
                          height: 12,
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      if (navInfo != null)
                        Text(
                          "B币：${navInfo.data.wallet!.bcoinBalance.toStringAsFixed(1)}\t\t\t\t硬币：${navInfo.data.money!.toStringAsFixed(1)}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.4)),
                        ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        )),
        SliverPadding(
            padding:
                const EdgeInsets.only(bottom: 24, top: 8, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numLabel(context,
                      label: "关注",
                      num: StringFormatUtils.formatNumberWithUnit(
                          navStat.data['following'])),
                  SizedBox(
                    height: 23,
                    width: 40,
                    child: VerticalDivider(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.1),
                    ),
                  ),
                  numLabel(context,
                      label: "粉丝",
                      num: StringFormatUtils.formatNumberWithUnit(
                          navStat.data['follower'])),
                  SizedBox(
                    height: 23,
                    width: 40,
                    child: VerticalDivider(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.1),
                    ),
                  ),
                  numLabel(context,
                      label: "动态",
                      num: StringFormatUtils.formatNumberWithUnit(
                          navStat.data['dynamic_count'])),
                ],
              ),
            )),
        SliverList.list(children: [
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text(
              "主题颜色",
              style: TextStyle(height: 1.2),
            ),
            subtitle: Text(
              "选择一个颜色作为种子构建整体色彩",
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.4)),
            ),
            trailing: const Icon(Icons.chevron_right),
            contentPadding: const EdgeInsets.only(left: 20, right: 12),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  final currentThemeColor = ref.watch(themeColorProvider);
                  // 选择颜色
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 24, bottom: 28, left: 24),
                            child: Text(
                              "选择主题颜色",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      mainAxisSpacing: 24,
                                      crossAxisSpacing: 24,
                                      childAspectRatio: 1.0),
                              children: [
                                ...ColorThemes.map(
                                  (e) {
                                    final index = ColorThemes.indexOf(e);
                                    return GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(themeColorProvider.notifier)
                                              .state = index;
                                          spInstance.setInt(
                                              "colorTheme", index);
                                        },
                                        child: Container(
                                          width: 52,
                                          height: 52,
                                          decoration: BoxDecoration(
                                              color: currentThemeColor == index
                                                  ? e
                                                  : e.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: currentThemeColor == index
                                              ? const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                )
                                              : const SizedBox.shrink(),
                                        ));
                                  },
                                )
                              ],
                            ),
                          )),
                        ],
                      ));
                },
              );
            },
          ),
          // 黑白名单
          ListTile(
            title: const Text(
              "黑白名单",
              style: TextStyle(height: 1.2),
            ),
            leading: const Icon(Icons.block_outlined),
            subtitle: Text(filterBlack ? "当前为黑名单模式" : "当前为白名单模式",
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.4))),
            trailing: Switch(
                value: filterBlack,
                onChanged: (value) {
                  setState(() {
                    ref.read(filterBlackProvider.notifier).state = value;
                  });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
            contentPadding: const EdgeInsets.only(left: 20, right: 12),
            onTap: () {
              setState(() {
                ref.read(filterBlackProvider.notifier).state = !filterBlack;
              });
            },
          ),
          // 过滤关键词
          ListTile(
            title: const Text(
              "过滤关键词",
              style: TextStyle(height: 1.2),
            ),
            subtitle: Text("用以过滤要展示的收藏夹",
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.4))),
            leading: const Icon(Icons.filter_alt_outlined),
            trailing: const Icon(Icons.chevron_right),
            contentPadding: const EdgeInsets.only(left: 20, right: 12),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  final filterKeys = ref.watch(filterKeysProvider);
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 24, bottom: 12, left: 24),
                            child: Text(
                              "设置关键词",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, bottom: 24, right: 24),
                            child: Text(
                              filterBlack
                                  ? "黑名单，包含下列关键字的收藏夹和列表不会被展示"
                                  : "白名单，仅展示包含下列关键字的收藏夹和列表",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.6)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 4),
                            child: TextField(
                              cursorHeight: 15,
                              controller: controller,
                              cursorColor: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.6),
                              style:
                                  const TextStyle(fontSize: 14, height: 1.10),
                              decoration: InputDecoration(
                                  isDense: true,
                                  suffixIcon: showSuffixIcon.value
                                      ? IconButton(
                                          onPressed: controller.clear,
                                          icon: const Icon(Icons.clear),
                                        )
                                      : null,
                                  hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.4)),
                                  hintText: '输入并回车以添加关键字',
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 18)),
                              onSubmitted: (value) {
                                if (value.isEmpty) return;
                                if (filterKeys
                                    .where((element) => element == value)
                                    .isEmpty) {
                                  ref.read(filterKeysProvider.notifier).state =
                                      [...filterKeys, value];

                                  controller.clear();
                                } else {}
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 24, left: 24, right: 24),
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: filterKeys
                                  .map((e) => InputChip(
                                        // shape: const RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.all(Radius.circular(4))),
                                        label: SizedBox(
                                          height: 22,
                                          child: Transform.translate(
                                            offset: const Offset(0, 1),
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .outline
                                                      .withOpacity(1)),
                                            ),
                                          ),
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer
                                            .withOpacity(0.6),
                                        side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer
                                              .withOpacity(0.6),
                                        ),
                                        // onPressed: () {},
                                        onDeleted: () {
                                          ref
                                                  .read(filterKeysProvider.notifier)
                                                  .state =
                                              filterKeys
                                                  .where(
                                                      (element) => element != e)
                                                  .toList();
                                        },
                                        deleteIcon: const Icon(
                                          IconData(
                                            0xe74a,
                                            fontFamily: "Icon",
                                          ),
                                          size: 14,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        ]),
                  );
                },
                useSafeArea: true,
              );
            },
          ),
          // 退出账号
          ListTile(
            leading: Icon(Icons.exit_to_app,
                color: Theme.of(context).colorScheme.error),
            title: Text(
              "退出账号",
              style: TextStyle(
                  height: 1.2, color: Theme.of(context).colorScheme.error),
            ),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).colorScheme.error),
            contentPadding: const EdgeInsets.only(left: 20, right: 12),
            onTap: () {},
          ),
        ]),
      ]),
    );
    // return Center(
    //   child: SizedBox(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         CachedNetworkImage(
    //             width: 360,
    //             imageUrl:
    //                 'https://s1.hdslb.com/bfs/static/laputa-search/client/assets/nodata.67f7a1c9.png'),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 12, bottom: 96),
    //           child: Text(
    //             '今天真是寂寞如雪啊~',
    //             style: TextStyle(
    //                 fontSize: 14,
    //                 color: Theme.of(context)
    //                     .colorScheme
    //                     .onBackground
    //                     .withOpacity(0.4)),
    //           ),
    //         ),
    //         FilledButton(
    //             onPressed: () {
    //               Log.e("点击登录按钮");
    //               context.push("/login");
    //             },
    //             child: const Text('登录')),
    //       ],
    //     ),
    //   ),
    // );
  }

  numLabel(context, {required String label, dynamic num}) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: num.toString(),
              style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.onBackground)),
          const TextSpan(
              text: "\n\n", style: TextStyle(height: 3, fontSize: 1)),
          TextSpan(
              text: label,
              style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5)))
        ]));
  }
}
