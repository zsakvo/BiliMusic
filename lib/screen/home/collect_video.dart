import 'package:bilimusic/api/collect_api.dart';
import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/models/collect/collect_medias.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/utils/misc.dart';
import 'package:bilimusic/utils/player.dart';
import 'package:bilimusic/utils/string.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectVideo extends StatefulHookConsumerWidget {
  final int id;
  const CollectVideo(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CollectVideoState();
}

class _CollectVideoState extends ConsumerState<CollectVideo> {
  final int ps = 20;
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController(keepScrollOffset: true);
    final showMediumToolBar = useState(false);
    final scrollEvent = useCallback(() {
      showMediumToolBar.value = scrollController.offset >= 94;
    }, [scrollController]);
    useEffect(() {
      scrollController.addListener(scrollEvent);
      return () {
        scrollController.removeListener(scrollEvent);
      };
    }, []);
    final player = ref.watch(playerProvider);
    final collectData = useFuture<CollectMediasResponseData>(
        useMemoized(() => CollectApi.getCollectMedias(widget.id)),
        initialData: null);

    final resList = useMemoized(
        () => (collectData.data?.medias ?? [])
            .reversed
            .map((element) => PlayRes(
                intro: "element.intro",
                title: element.title,
                artist: element.upper.name,
                cover: element.cover,
                aid: element.id,
                type: ResType.video))
            .toList(),
        [collectData]);
    return Material(
      child: Builder(
        builder: (context) {
          switch (collectData.connectionState) {
            case ConnectionState.done:
              var collectDatas = collectData.data!;
              return Stack(
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 38),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  imageUrl: collectDatas.info.cover,
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
                                      "${collectDatas.info.upper.name}\t·\t共${collectDatas.info.mediaCount}首音乐",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.5),
                                          height: 1.8),
                                    ),
                                    Text(
                                      "简介：${collectDatas.info.intro.isEmpty ? "暂无简介" : collectDatas.info.intro} ",
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
                                          onPressed: () async {
                                            PlayerUtils.playList(
                                                player, ref, resList);
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
                          int endIndex = collectDatas.medias.length - 1;
                          final CollectMedia video =
                              collectDatas.medias[endIndex - index];
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
                                    flex: 5,
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
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        StringFormatUtils.timeLengthFormat(
                                            video.duration),
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
                                PlayerUtils.playList(player, ref, resList,
                                    initialIndex: index);
                              },
                            ),
                          );
                        },
                        itemCount: collectDatas.medias.length,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          PlayerUtils.playList(
                                              player, ref, resList);
                                        },
                                        icon: Icon(
                                          Icons.play_circle,
                                          size: 30,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          MiscUtil.share(
                                              'https://www.bilibili.com/video/av${resList.first.aid}');
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
