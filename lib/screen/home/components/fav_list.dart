import 'package:bilimusic/api/discover_api.dart';
import 'package:bilimusic/api/home_api.dart';

import 'package:bilimusic/models/discover/collect_list.dart';
import 'package:bilimusic/models/home/fav_list.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/config/config_provider.dart';
import 'package:bilimusic/utils/log.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavListComponent extends StatefulHookConsumerWidget {
  const FavListComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavListComponentState();
}

class _FavListComponentState extends ConsumerState<FavListComponent> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
        // scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              context.push("/search");
            },
            icon: SvgPicture.asset(
              "assets/svg/search.svg",
              width: 22,
            ),
          )
          //   ],
        ],
      ),
      body: EasyRefresh(
          controller: refreshController,
          // refreshOnStart: true,
          onRefresh: () {
            fetchFolders();
          },
          child: CustomScrollView(
            slivers: [
              // SliverAppBar.medium(
              //   title: const Text("我的收藏"),
              //   scrolledUnderElevation: 0,
              //   actions: [
              //     IconButton(
              //       onPressed: () {
              //         context.push("/search");
              //       },
              //       icon: SvgPicture.asset(
              //         "assets/svg/search.svg",
              //         width: 22,
              //       ),
              //     )
              //     //   ],
              //   ],
              // ),
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
              // SliverPadding(
              //   padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              //   sliver: SliverToBoxAdapter(
              //     child: Text(
              //       "个人收藏",
              //       style: Theme.of(context).textTheme.headlineSmall,
              //     ),
              //   ),
              // ),
              // SliverPadding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              //   sliver: SliverGrid.builder(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         // mainAxisExtent: 78,
              //         childAspectRatio: 2.3,
              //         mainAxisSpacing: 16,
              //         crossAxisSpacing: 16),
              //     itemCount: favoriteFolders.value.length + 1,
              //     itemBuilder: (context, index) {
              //       if (index == 0) {
              //         // 包含封面，标题，作者，视频数的卡片
              //         return Card(
              //             elevation: 0,
              //             margin: EdgeInsets.zero,
              //             color: Theme.of(context).colorScheme.secondaryContainer,
              //             // 无圆角
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(8)),
              //             child: InkWell(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 16, vertical: 4),
              //                 child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceEvenly,
              //                     children: [
              //                       Text(
              //                         "本地收藏夹",
              //                         style: TextStyle(
              //                             color: Theme.of(context)
              //                                 .colorScheme
              //                                 .onBackground,
              //                             fontSize: 18),
              //                       ),
              //                       Text(
              //                         "纯本地数据哦",
              //                         style: TextStyle(
              //                             color: Theme.of(context)
              //                                 .colorScheme
              //                                 .onBackground
              //                                 .withOpacity(0.5),
              //                             fontSize: 13),
              //                       ),
              //                     ]),
              //               ),
              //               onTap: () {
              //                 context.push("/play_list/local/0/本地收藏");
              //               },
              //             ));
              //       } else {
              //         final folder = favoriteFolders.value[index - 1];
              //         // 包含封面，标题，作者，视频数的卡片
              //         return Card(
              //             elevation: 0,
              //             margin: EdgeInsets.zero,
              //             color: Theme.of(context).colorScheme.secondaryContainer,
              //             // 无圆角
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(8)),
              //             child: InkWell(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 16, vertical: 4),
              //                 child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceEvenly,
              //                     children: [
              //                       Text(
              //                         folder.title,
              //                         style: TextStyle(
              //                             color: Theme.of(context)
              //                                 .colorScheme
              //                                 .onBackground,
              //                             fontSize: 18),
              //                       ),
              //                       Text(
              //                         "${folder.mediaCount} 个媒体",
              //                         style: TextStyle(
              //                             color: Theme.of(context)
              //                                 .colorScheme
              //                                 .onBackground
              //                                 .withOpacity(0.5),
              //                             fontSize: 13),
              //                       ),
              //                     ]),
              //               ),
              //               onTap: () {
              //                 context.push(
              //                     "/play_list/favorites/${folder.id}/${folder.title}");
              //               },
              //             ));
              //       }
              //     },
              //   ),
              // ),

              // SliverPadding(
              //   padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              //   sliver: SliverToBoxAdapter(
              //     child: Text(
              //       "播放列表",
              //       style: Theme.of(context).textTheme.headlineSmall,
              //     ),
              //   ),
              // ),
              SliverPadding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, bottom: 0, top: 0),
                  sliver: SliverList.builder(
                    itemBuilder: (context, index) {
                      if (index > 0) {
                        final folder = favoriteFolders.value[index - 1];
                        return ListTile(
                          // leading: Icon(
                          //   const IconData(0xe668, fontFamily: "Icon"),
                          //   color: Theme.of(context).colorScheme.primary,
                          // ),
                          // minLeadingWidth: 32,
                          contentPadding:
                              const EdgeInsets.only(left: 16, right: 0),
                          title: Text(
                            folder.title,
                            style: const TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.play_circle,
                              color: Theme.of(context).colorScheme.primary,
                              size: 28,
                            ),
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            "${folder.mediaCount} 个媒体",
                            style: const TextStyle(fontSize: 13),
                          ),
                          onTap: () {
                            context.push(
                                "/play_list/favorites/${folder.id}/${folder.title}");
                          },
                        );
                      } else {
                        return ListTile(
                          // leading: Icon(
                          //   const IconData(0xe668, fontFamily: "Icon"),
                          //   color: Theme.of(context).colorScheme.primary,
                          // ),
                          // minLeadingWidth: 32,
                          contentPadding:
                              const EdgeInsets.only(left: 16, right: 0),
                          title: const Text(
                            "本地收藏夹",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.play_circle,
                              color: Theme.of(context).colorScheme.primary,
                              size: 28,
                            ),
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            "0 个媒体",
                            style: const TextStyle(fontSize: 13),
                          ),
                          onTap: () {
                            context.push("/play_list/local/0/本地收藏");
                          },
                        );
                      }
                    },
                    itemCount: favoriteFolders.value.length + 1,
                  )),
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

              // const SliverToBoxAdapter(
              //   child: SizedBox(height: 82),
              // )
            ],
          )),
    );
  }
}
