import 'package:bilimusic/api/search_api.dart';
import 'package:bilimusic/components/app_top_bar/provider.dart';
import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/models/search/search_video.dart' as sv show Result;
import 'package:bilimusic/models/search/search_user.dart' as su show Result;
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:bilimusic/utils/play.dart';
import 'package:bilimusic/utils/player.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loadmore/loadmore.dart';

import 'load_more_delegate.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen(this.keyword, {super.key});
  final String keyword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with TickerProviderStateMixin {
  final videoFilterLabels = ["综合排序", "最多点击", "最新发布", "最多弹幕", "最多收藏"];
  final viderParamValues = [
    {"order": "totalrank"},
    {"order": "click"},
    {"order": "pubdate"},
    {"order": "dm"},
    {"order": "stow"}
  ];
  final userFilterLabels = ["默认排序", "粉丝由高到低", "粉丝由低到高", "Lv等级由高到低", "Lv等级由低到高"];
  final userParamValues = [
    {"order": 0, "order_sort": 0},
    {"order": "fans", "order_sort": "0"},
    {"order": "fans", "order_sort": "1"},
    {"order": "level", "order_sort": "0"},
    {"order": "level", "order_sort": "1"}
  ];

  @override
  Widget build(BuildContext context) {
    final currentFilter = useState(0);
    final tabController = useTabController(initialLength: 2, vsync: this);
    final tabIndex = useState(0);
    final searchPage = useState(0);
    final loadFinish = useState(false);
    final searchType = useMemoized(
        () => tabController.index == 0 ? "video" : "bili_user",
        [tabIndex.value]);

    final filterLabels = useMemoized(
        () => tabController.index == 0 ? videoFilterLabels : userFilterLabels,
        [tabIndex.value]);

    final filterParams = useMemoized(
        () => tabController.index == 0 ? viderParamValues : userParamValues,
        [tabIndex.value]);

    final searchItems = useState<dynamic>([]);

    useEffect(() {
      searchPage.value = 0;
      searchItems.value = [];
      loadFinish.value = false;
      return () {};
    }, [filterParams, searchType, currentFilter.value]);

    useEffect(() {
      currentFilter.value = 0;
      return () {};
    }, [searchType]);

    loadMoreFunc() async {
      searchPage.value++;
      final items = await SearchApi.search(
          widget.keyword, filterParams[currentFilter.value],
          page: searchPage.value, searchType: searchType);
      searchItems.value = [...searchItems.value, ...items];
      if (items.isEmpty) loadFinish.value = true;
      return true;
    }

    tabListener() {
      tabIndex.value = tabController.index;
    }

    useEffect(() {
      tabController.addListener(tabListener);
      return () => {tabController.removeListener(tabListener)};
    }, [tabController]);

    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.7,
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.4)))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: TabBar(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          controller: tabController,
                          dividerColor: Colors.transparent,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          tabs: const [
                            Tab(
                              text: "视频",
                            ),
                            Tab(
                              text: "用户",
                            ),
                          ]),
                    ),
                    Expanded(
                        child: Container(
                      width: 300,
                    ))
                  ],
                ),
              )),
          Container(
            margin: const EdgeInsets.only(top: 24, left: 28, right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: filterLabels
                  .asMap()
                  .map((index, label) => MapEntry(
                      index,
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: FilterChip(
                          label: Text(
                            label,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          selected: currentFilter.value == index,
                          side: BorderSide.none,
                          onSelected: (value) {
                            if (value) {
                              currentFilter.value = index;
                            }
                          },
                        ),
                      )))
                  .values
                  .toList(),
            ),
          ),

          // 根据 searchResults 不同状态通过 switch 分发组件
          Container(
            height: MediaQuery.of(context).size.height - 264,
            padding: const EdgeInsets.only(left: 28, right: 0, top: 24),
            child: LoadMore(
                isFinish: loadFinish.value,
                onLoadMore: loadMoreFunc,
                delegate: CustomLoadMoreDelegate(context),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final res = searchItems.value[index];
                    if (tabController.index == 0) {
                      res as sv.Result;
                    } else {
                      res as su.Result;
                    }
                    final titleStrMaps = tabController.index == 0
                        ? StringFormatUtils.splitStringWithEmTags(res.title)
                        : [];
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              index == searchItems.value.length - 1 ? 24 : 6),
                      child: tabIndex.value == 0
                          ? InkWell(
                              onTap: () {
                                res as sv.Result;
                                Player().play([
                                  PlayMedia(
                                      aid: res.aid,
                                      cid: null,
                                      title: res.title,
                                      author: res.author,
                                      cover: "https:${res.pic}",
                                      duration: 200,
                                      intro: res.desc)
                                ]);
                                // PlayerUtils.playRes(
                                //     player,
                                //     ref,
                                //     PlayRes(
                                //         type: ResType.video,
                                //         title: titleStrMaps
                                //             .map((e) => e["content"])
                                //             .join(""),
                                //         artist: res.author,
                                //         cover: "https:${res.pic}",
                                //         aid: res.id),
                                //     append: false);
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: CachedNetworkImage(
                                      imageUrl: "https:${res.pic}",
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Flexible(
                                      child: Container(
                                    height: 64,
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              children: titleStrMaps
                                                  .map((title) => TextSpan(
                                                      text: title["content"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          color: title["isKey"]
                                                              ? Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary
                                                                  .withOpacity(
                                                                      0.7)
                                                              : Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.7))))
                                                  .toList()),
                                        ),
                                        Text(
                                            "${res.author}\t·\t${res.duration}",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground
                                                    .withOpacity(0.4),
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ))
                                ],
                              ))
                          : InkWell(
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https:${(res as su.Result).upic}",
                                      width: 64,
                                    ),
                                  ),
                                  Flexible(
                                      child: Container(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              res.uname,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12),
                                              child: SvgPicture.asset(
                                                "assets/svg/lv${res.level}.svg",
                                                width: 12,
                                                height: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${StringFormatUtils.formatNumberWithUnit(res.fans)}粉丝\t·\t${res.videos}视频",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground
                                                        .withOpacity(0.4)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                              onTap: () {
                                ref
                                    .read(topbarStateProvider.notifier)
                                    .pushState(TopBarState(
                                        showBack: true, title: '用户详情'));
                                context.push("/browser/user/${res.mid}");
                              },
                            ),
                    );
                  },
                  itemCount: searchItems.value.length,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Divider(
                        thickness: 0.1,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.7),
                        indent: 84,
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
