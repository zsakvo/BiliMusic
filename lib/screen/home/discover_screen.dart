import 'package:bilimusic/api/discover_api.dart';
import 'package:bilimusic/api/home_api.dart';
import 'package:bilimusic/components/app_top_bar/provider.dart';
import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/models/discover/collect_list.dart';
import 'package:bilimusic/models/home/region_video.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/utils/player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class DiscoverScreen extends StatefulHookConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    var originalPn = useState(1);
    var coverPn = useState(1);
    var vocalPn = useState(1);
    var volumePn = useState(1);

    final upMid = ref.watch(navInfoProvider.select((value) => value?.data.mid));
    final collectListItems = useFuture<List<CollectListResponseListElement>>(
        useMemoized(() => DiscoverApi.getCollectList(upMid: upMid), [upMid]),
        initialData: []);

    final originalVideos = useFuture<List<RegionVideoItem>>(
        useMemoized(() => HomeApi.requestRegionVideos(28, pn: originalPn.value),
            [originalPn.value]),
        initialData: []);
    final coverVideos = useFuture<List<RegionVideoItem>>(
        useMemoized(() => HomeApi.requestRegionVideos(31, pn: coverPn.value),
            [coverPn.value]),
        initialData: []);
    final vocalVideos = useFuture<List<RegionVideoItem>>(
        useMemoized(() => HomeApi.requestRegionVideos(30, pn: vocalPn.value),
            [vocalPn.value]),
        initialData: []);
    final volumeVideos = useFuture<List<RegionVideoItem>>(
        useMemoized(() => HomeApi.requestRegionVideos(59, pn: volumePn.value),
            [volumePn.value]),
        initialData: []);
    //
    return Material(
      child: CustomScrollView(
        slivers: [
          if (upMid != null && collectListItems.data!.isNotEmpty) ...[
            SliverPadding(
              padding: const EdgeInsets.only(top: 28, left: 28, bottom: 0),
              sliver: SliverToBoxAdapter(
                  child: Text("收藏列表",
                      style: Theme.of(context).textTheme.headlineSmall
                      // ?.copyWith(fontWeight: FontWeight.w400),
                      )),
            ),
            ResponsiveSliverGridList(
                horizontalGridSpacing: 18,
                verticalGridSpacing: 16,
                horizontalGridMargin: 28,
                verticalGridMargin: 20,
                minItemWidth: 140,
                minItemsPerRow: 5,
                maxItemsPerRow: 8,
                sliverChildBuilderDelegateOptions:
                    SliverChildBuilderDelegateOptions(),
                children: collectListItems.data!
                    .map((item) => InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Card(
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: item.cover,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, bottom: 3),
                                  child: Text(
                                    item.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                Text(
                                  "媒体数 ${item.mediaCount}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            ref.read(topbarStateProvider.notifier).pushState(
                                TopBarState(showBack: true, title: item.title));
                            // context.push("/browser/collect", extra: item.id);
                            context.go("/browser/play_list/folders/${item.id}");
                          },
                        ))
                    .toList()),
            const SliverToBoxAdapter(
              child: Divider(
                indent: 28,
                endIndent: 28,
                thickness: 0.3,
              ),
            ),
          ],
          ...getRegionWidget(
              pn: originalPn, videos: originalVideos.data!, title: "原创音乐"),
          const SliverPadding(
            padding: EdgeInsets.only(top: 32),
            sliver: SliverToBoxAdapter(
              child: Divider(
                indent: 28,
                endIndent: 28,
                thickness: 0.3,
              ),
            ),
          ),
          ...getRegionWidget(
              pn: coverPn, videos: coverVideos.data!, title: "翻唱"),
          const SliverPadding(
            padding: EdgeInsets.only(top: 32),
            sliver: SliverToBoxAdapter(
              child: Divider(
                indent: 28,
                endIndent: 28,
                thickness: 0.3,
              ),
            ),
          ),
          ...getRegionWidget(
              pn: vocalPn, videos: vocalVideos.data!, title: "VOCALOID·UTAU"),
          const SliverPadding(
            padding: EdgeInsets.only(top: 32),
            sliver: SliverToBoxAdapter(
              child: Divider(
                indent: 28,
                endIndent: 28,
                thickness: 0.3,
              ),
            ),
          ),
          ...getRegionWidget(
              pn: volumePn, videos: volumeVideos.data!, title: "演奏"),
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.only(top: 48, bottom: 16, right: 240),
            alignment: Alignment.center,
            child: Text(
              "总得有个头吧 :)",
              style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.4)),
            ),
          )),
        ],
      ),
    ); // return Container(
  }

  getRegionWidget(
      {required String title,
      required List<RegionVideoItem> videos,
      required ValueNotifier<int> pn}) {
    final player = ref.watch(playerProvider);
    if (videos.isNotEmpty && videos.length < 14) {
      pn.value = 0;
    }
    return [
      SliverPadding(
          padding: const EdgeInsets.only(bottom: 24, top: 18, left: 28),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall
                    // ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                      onPressed: () {
                        pn.value++;
                      },
                      icon: const Icon(Icons.refresh)),
                )
              ],
            ),
          )),
      ResponsiveSliverGridList(
        horizontalGridSpacing: 18, // Horizontal space between grid items
        verticalGridSpacing: 16, // Vertical space between grid items
        horizontalGridMargin: 28, // Horizontal space around the grid
        // verticalGridMargin: 50, // Vertical space around the grid
        minItemWidth:
            300, // The minimum item width (can be smaller, if the layout constraints are smaller)
        minItemsPerRow:
            2, // The minimum items to show in a single row. Takes precedence over minItemWidth
        maxItemsPerRow: 2,
        sliverChildBuilderDelegateOptions: SliverChildBuilderDelegateOptions(),
        children: videos
            .asMap()
            .map(
              (index, video) => MapEntry(
                  index,
                  InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl: video.pic,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, right: 8),
                            child: Text(
                              (index + 1).toString().padLeft(2, "0"),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.5)),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: 64,
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  video.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  video.owner.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.5)),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    onTap: () async {
                      PlayerUtils.playRes(
                          player,
                          ref,
                          PlayRes(
                              type: ResType.video,
                              title: video.title,
                              artist: video.owner.name,
                              cover: video.pic,
                              aid: video.aid,
                              cid: video.cid),
                          append: false);
                      // print(video.toRawJson());
                      // var url = await Api.getAudioCdnUrl(aid: video.aid, cid: video.cid);
                    },
                  )),
            )
            .values
            .toList(),
      ),
    ];
  }
}
