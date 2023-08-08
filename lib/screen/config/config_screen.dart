import 'package:bilimusic/main.dart';
import 'package:bilimusic/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'config_provider.dart';

// ignore: non_constant_identifier_names
final ColorThemes = [
  Colors.pink,
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.yellow,
  Colors.lime,
  Colors.lightGreen,
  Colors.green,
  Colors.teal,
  Colors.cyan,
  Colors.lightBlue,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.deepPurple,
  Colors.blueGrey,
  Colors.brown,
  Colors.grey,
];

class ConfigScreen extends StatefulHookConsumerWidget {
  const ConfigScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends ConsumerState<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    final currentThemeColor = ref.watch(themeColorProvider);
    final controller = useTextEditingController();
    final showSuffixIcon = useState(false);
    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>((states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    });
    final filterKeys = ref.watch(filterKeysProvider);
    final filterBlack = ref.watch(filterBlackProvider);

    useEffect(() {
      spInstance.setStringList("filterKeys", filterKeys);
      return () {};
    }, [filterKeys]);

    useEffect(() {
      spInstance.setBool("filterBlack", filterBlack);
      return () {};
    }, [filterBlack]);

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

    final cacheSize = useState("0B");
    useEffect(() {
      getCacheSize().then((value) {
        cacheSize.value = value;
      });
      return () {};
    }, []);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, top: 36, right: 24, bottom: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text(
                    "主题配色",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    ...ColorThemes.map(
                      (e) {
                        final index = ColorThemes.indexOf(e);
                        return GestureDetector(
                            onTap: () {
                              ref.read(themeColorProvider.notifier).state =
                                  index;
                              spInstance.setInt("colorTheme", index);
                            },
                            child: Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: currentThemeColor == index
                                      ? e
                                      : e.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(50)),
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 24, top: 64),
                  child: Text(
                    "收藏夹过滤",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 300,
                              margin: const EdgeInsets.only(right: 36),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer
                                      .withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                cursorHeight: 15,
                                controller: controller,
                                cursorColor: Theme.of(context)
                                    .colorScheme
                                    .tertiary
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
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 18)),
                                onSubmitted: (value) {
                                  if (value.isEmpty) return;
                                  if (filterKeys
                                      .where((element) => element == value)
                                      .isEmpty) {
                                    ref
                                        .read(filterKeysProvider.notifier)
                                        .state = [...filterKeys, value];

                                    controller.clear();
                                  } else {}
                                },
                              )),
                          Switch(
                            thumbIcon: thumbIcon,
                            value: filterBlack,
                            onChanged: (value) {
                              setState(() {
                                ref.read(filterBlackProvider.notifier).state =
                                    value;
                              });
                            },
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 8),
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
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
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
                                ref.read(filterKeysProvider.notifier).state =
                                    filterKeys
                                        .where((element) => element != e)
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
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 12, top: 64),
                  child: Text(
                    "缓存清理",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        "移除封面和音乐缓存文件，可节省空间",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.6)),
                      )),
                  GestureDetector(
                    child: Text(
                      "清理 ${cacheSize.value} 缓存",
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6)),
                    ),
                    onTap: () async {
                      await clearCache();
                      getCacheSize().then((value) {
                        cacheSize.value = value;
                      });
                    },
                  )
                ]),
                const Padding(
                  padding: EdgeInsets.only(bottom: 24, top: 64),
                  child: Text(
                    "关于应用",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      "BiliMusic —— 基于 Flutter 构建的开源哔哩哔哩音乐播放器",
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.6)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    child: Text(
                      "项目主页：https://github.com/zsakvo/BiliMusic",
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6)),
                    ),
                    onTap: () {
                      launchUrl(
                          Uri.parse('https://github.com/zsakvo/BiliMusic'));
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
