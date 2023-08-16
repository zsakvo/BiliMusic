import 'package:bilimusic/api/discover_api.dart';
import 'package:bilimusic/api/home_api.dart';

import 'package:bilimusic/models/discover/collect_list.dart';
import 'package:bilimusic/models/home/fav_list.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/config/config_provider.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyListComponent extends StatefulHookConsumerWidget {
  const MyListComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyListComponentState();
}

class _MyListComponentState extends ConsumerState<MyListComponent> {
  final EasyRefreshController refreshController =
      EasyRefreshController(controlFinishRefresh: false);
  final listNames = ["订阅列表", "在线收藏", "本地歌单"];
  @override
  Widget build(BuildContext context) {
    // final tabController = useTabController(initialLength: 2);
    // final currentFilterIndex = useState(0);
    final upMid = ref.watch(navInfoProvider.select((value) => value?.data.mid));
    final filterKeys = ref.watch(filterKeysProvider);
    final filterBlack = ref.watch(filterBlackProvider);
    final collectFolders = useState<List<CollectListResponseListElement>>([]);
    final favoriteFolders = useState<List<FavFolderList>>([]);
    final fetchFolders = useCallback(() async {
      final colFolders = await DiscoverApi.getCollectList(upMid: upMid);
      final List<FavFolderList> hitList = [];
      final favFolders = await HomeApi.getFavFolderList(upMid);
      for (var folder in favFolders) {
        if (filterBlack) {
          if (filterKeys
                  .where((element) => folder.title.contains(element))
                  .isEmpty &&
              folder.mediaCount > 0) {
            hitList.add(folder);
          }
        } else {
          if (filterKeys
                  .where((element) => folder.title.contains(element))
                  .isNotEmpty &&
              folder.mediaCount > 0) {
            hitList.add(folder);
          }
        }
      }
      // foldersMap.value = {
      //   "collect": collectFolders,
      //   "fav": hitList,
      // };
      collectFolders.value =
          colFolders.where((element) => element.mediaCount > 0).toList();
      favoriteFolders.value = hitList;
    }, [upMid, filterKeys, filterBlack]);
    useEffect(() {
      refreshController.callRefresh();
      return () {};
    }, [upMid]);
    return EasyRefresh(
        controller: refreshController,
        // refreshOnStart: true,
        onRefresh: () {
          fetchFolders();
        },
        child: CustomScrollView(
          slivers: [
            // SliverPadding(
            //   padding: EdgeInsets.symmetric(vertical: 8),
            //   sliver: SliverToBoxAdapter(
            //     child: FilledTabBar(
            //         tabController: tabController, tabs: ["列表", "收藏"]),
            //   ),
            // ),
            // SliverPadding(
            //   padding: EdgeInsets.only(
            //       bottom: 4,
            //       left: currentFilterIndex.value != 0 ? 0 : 16,
            //       top: 8),
            //   sliver: SliverToBoxAdapter(
            //       child: Row(
            //     children: listNames
            //         .asMap()
            //         .map((index, label) => MapEntry(
            //               index,
            //               FilterChip(
            //                 label: Text(
            //                   label,
            //                   style: const TextStyle(
            //                       fontWeight: FontWeight.w400, fontSize: 13),
            //                 ),
            //                 // showCheckmark: false,
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(30)),
            //                 selected: currentFilterIndex.value == index,
            //                 // padding: EdgeInsets.symmetric(horizontal: 8),
            //                 side: BorderSide.none,
            //                 onSelected: (value) {
            //                   if (value) {
            //                     currentFilterIndex.value = index;
            //                   }
            //                 },
            //               ),
            //             ))
            //         .values
            //         .toList(),
            //   )),
            // ),

            // SliverPadding(
            //   padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            //   sliver: SliverToBoxAdapter(
            //     child: Text(
            //       "播放列表",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            //     ),
            //   ),
            // ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "个人收藏",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisExtent: 78,
                    childAspectRatio: 2.3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemCount: favoriteFolders.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // 包含封面，标题，作者，视频数的卡片
                    return Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        // 无圆角
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "本地收藏夹",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "纯本地数据哦",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.5),
                                        fontSize: 13),
                                  ),
                                ]),
                          ),
                          onTap: () {
                            context.push("/play_list/local/0/本地收藏");
                          },
                        ));
                  } else {
                    final folder = favoriteFolders.value[index - 1];
                    // 包含封面，标题，作者，视频数的卡片
                    return Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        // 无圆角
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    folder.title,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${folder.mediaCount} 个媒体",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.5),
                                        fontSize: 13),
                                  ),
                                ]),
                          ),
                          onTap: () {
                            context.push(
                                "/play_list/favorites/${folder.id}/${folder.title}");
                          },
                        ));
                  }
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "播放列表",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisExtent: 196,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemCount: collectFolders.value.length,
                itemBuilder: (context, index) {
                  final folder = collectFolders.value[index];
                  // 包含封面，标题，作者，视频数的卡片
                  return InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: CachedNetworkImage(
                            imageUrl: folder.cover,
                            // memCacheWidth: 100,
                            // memCacheHeight: 64,
                            // width: 100,
                            // height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          folder.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          folder.upper.name,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.5),
                              fontSize: 13),
                        ),
                      ],
                    ),
                    onTap: () {
                      context.push(
                          "/play_list/folders/${folder.id}/${folder.title}");
                    },
                  );
                },
              ),
            ),
            // SliverList.builder(
            //   itemBuilder: (context, index) {
            //     final colFolder = collectFolders.value[index];
            //     return ListTile(
            //       leading: ClipRRect(
            //           borderRadius: BorderRadius.circular(6),
            //           child: CachedNetworkImage(
            //             imageUrl: colFolder.cover,
            //             memCacheWidth: 100,
            //             memCacheHeight: 64,
            //             width: 56,
            //             height: 56,
            //             fit: BoxFit.cover,
            //           )),
            //       title: Text(
            //         colFolder.title,
            //         style: const TextStyle(fontSize: 15),
            //       ),
            //       subtitle: Text(
            //         "${colFolder.upper.name} · 共${colFolder.mediaCount}个视频",
            //         style: TextStyle(
            //             fontSize: 13,
            //             color: Theme.of(context)
            //                 .colorScheme
            //                 .onSurfaceVariant
            //                 .withOpacity(0.6)),
            //       ),
            //       visualDensity: const VisualDensity(vertical: 1),
            //       onTap: () {
            //         context.push(
            //             "/play_list/folders/${colFolder.id}/${colFolder.title}");
            //       },
            //     );
            //   },
            //   itemCount: collectFolders.value.length,
            // ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 82),
            )
          ],
        ));
  }
}
