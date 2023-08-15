import 'package:bilimusic/api/search_api.dart';
import 'package:bilimusic/models/search/search_video.dart';
import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:bilimusic/utils/play.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchMobileScreen extends StatefulHookConsumerWidget {
  const SearchMobileScreen(this.keyword, {super.key});
  final String keyword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchMobileScreenState();
}

class _SearchMobileScreenState extends ConsumerState<SearchMobileScreen>
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

    refreshFunc() {
      searchPage.value = 0;
      searchItems.value = [];
      loadFinish.value = false;
      return loadMoreFunc();
    }

    tabListener() {
      tabIndex.value = tabController.index;
    }

    useEffect(() {
      tabController.addListener(tabListener);
      return () => {tabController.removeListener(tabListener)};
    }, [tabController]);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text('搜索：${widget.keyword}'),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: EasyRefresh(
              onLoad: loadMoreFunc,
              onRefresh: refreshFunc,
              refreshOnStart: true,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final Result item = searchItems.value[index];
                  final titleStrMaps = tabController.index == 0
                      ? StringFormatUtils.splitStringWithEmTags(item.title)
                      : [];
                  return ListTile(
                    title: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          children: titleStrMaps
                              .map((title) => TextSpan(
                                  text: title["content"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: title["isKey"]
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.7)
                                          : Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.7))))
                              .toList()),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: "https:${item.pic}",
                        memCacheWidth: 64,
                        memCacheHeight: 64,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    minLeadingWidth: 12,
                    subtitle: Text("${item.author}\t\t\t${item.duration}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5))),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        size: 20,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                      ),
                      onPressed: () {},
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 20, top: 2, bottom: 2, right: 0),
                    dense: true,
                    // visualDensity: VisualDensity.compact,
                    onTap: () {
                      // ref.read(provider.notifier).playMedia(index);
                      Player().play([
                        PlayMedia(
                          intro: "av${item.id}",
                          title: titleStrMaps
                              .map((title) => title["content"])
                              .join(""),
                          author: item.author,
                          cover: "https:${item.pic}",
                          aid: item.id,
                          duration: 360,
                          cid: null,
                        )
                      ], index: 0);
                    },
                  );
                },
                itemCount: searchItems.value.length,
              ))),
    );
  }
}
