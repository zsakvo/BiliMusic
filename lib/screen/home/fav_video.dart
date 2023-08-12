import 'package:bilimusic/api/fav_api.dart';
import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/models/fav/fav_detail.dart';
import 'package:bilimusic/models/home/fav_resc.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/utils/misc.dart';
import 'package:bilimusic/utils/player.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavVideo extends StatefulHookConsumerWidget {
  final dynamic id;
  const FavVideo(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavVideoState();
}

class _FavVideoState extends ConsumerState<FavVideo> {
  final int ps = 20;
  @override
  Widget build(BuildContext context) {
    final pn = useState(1);
    final scrollController = useScrollController(keepScrollOffset: true);
    final showMediumToolBar = useState(false);
    final scrollEvent = useCallback(() {
      // print(scrollController.offset);
      showMediumToolBar.value = scrollController.offset >= 94;
    }, [scrollController]);
    useEffect(() {
      scrollController.addListener(scrollEvent);
      // _player = AudioPlayer(userAgent: ApiConstants.userAgent);
      return () {
        scrollController.removeListener(scrollEvent);
      };
    }, []);
    final player = ref.watch(playerProvider);
    final AsyncSnapshot<FavDetailResponseData> folderDetail = useFuture(
        useMemoized(() => FavApi.getFavDolderDetail(widget.id)),
        initialData: null);
    final videos = useState<List<FavMedia>>([]);
    useEffect(() {
      if (folderDetail.hasData && videos.value.isNotEmpty) {
        if (folderDetail.data!.mediaCount - pn.value * ps > 0) {
          pn.value++;
        }
      }
      return () => {};
    }, [videos.value, folderDetail.data]);
    useEffect(() {
      FavApi.getFavRescList(widget.id, ps: ps, pn: pn.value).then((res) {
        videos.value = [...videos.value, ...res.medias];
      });
      return () => {};
    }, [pn.value]);

    // 从 videos 生成 playRes 列表
    final playResList = useMemoized(() {
      return videos.value
          .map((element) => PlayRes(
              intro: element.intro,
              title: element.title,
              artist: element.upper.name,
              cover: element.cover,
              aid: element.id,
              cid: element.ugc.firstCid,
              type: ResType.video))
          .toList();
    }, [videos.value]);

    return Material(
      child: Builder(
        builder: (context) {
          switch (folderDetail.connectionState) {
            case ConnectionState.done:
              var folderDetailData = folderDetail.data!;
              return Stack(
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 28, horizontal: 42),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  imageUrl: folderDetailData.cover,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${folderDetailData.upper.name}\t·\t共${folderDetailData.mediaCount}首音乐",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.5),
                                          height: 1.8),
                                    ),
                                    Text(
                                      "简介：${folderDetailData.intro.isEmpty ? "暂无简介" : folderDetailData.intro} ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.5),
                                          height: 1.8),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: FilledButton.icon(
                                          onPressed: () {
                                            PlayerUtils.playList(
                                                player, ref, playResList);
                                          },
                                          icon: const Icon(
                                            Icons.play_circle_outline_outlined,
                                            size: 22,
                                          ),
                                          label: const Text("播放全部")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverList.builder(
                        itemBuilder: (context, index) {
                          final FavMedia video = videos.value[index];
                          return Container(
                            color: index % 2 == 0
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant
                                    .withOpacity(0.2),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 42),
                            child: InkWell(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: CachedNetworkImage(
                                      imageUrl: video.cover,
                                      width: 42,
                                      height: 42,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 28),
                                      child: Text(
                                        video.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground
                                                .withOpacity(0.8)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        video.upper.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground
                                                .withOpacity(0.4)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        video.intro,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground
                                                .withOpacity(0.4)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                PlayerUtils.playList(player, ref, playResList,
                                    initialIndex: index);
                              },
                            ),
                          );
                        },
                        itemCount: videos.value.length,
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: showMediumToolBar.value
                        ? Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.7,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer))),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(
                                left: 18, top: 12, bottom: 8),
                            // height: 120,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      PlayerUtils.playList(
                                          player, ref, playResList);
                                    },
                                    icon: Icon(
                                      Icons.play_circle,
                                      size: 30,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      MiscUtil.share(
                                          'https://www.bilibili.com/video/av${playResList.first.aid}');
                                    },
                                    icon: Icon(
                                      Icons.share,
                                      size: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.6),
                                    ))
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              );
            default:
              return Container(
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(),
                ),
              );
          }
        },
      ),
    );
  }
}
