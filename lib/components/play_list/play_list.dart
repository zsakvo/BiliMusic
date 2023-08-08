import 'package:bilimusic/components/player/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayList extends StatefulHookConsumerWidget {
  const PlayList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayListState();
}

class _PlayListState extends ConsumerState<PlayList> {
  @override
  Widget build(BuildContext context) {
    final playList = ref.watch(playResProvider);
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        child: Container(
          width: 450,
          height: MediaQuery.of(context).size.height - 80,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(0.07),
            border: Border(
                left: BorderSide(
                    width: 1.4,
                    color: Theme.of(context).colorScheme.primaryContainer)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                padding: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "正在播放",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "共${playList.length}首",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.5)),
                            ),
                            // TextButton(
                            //     onPressed: () {}, child: const Text("清空列表"))
                          ],
                        ))
                  ],
                ),
              ),
              Expanded(
                child: playList.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                              width: 360,
                              imageUrl:
                                  'https://s1.hdslb.com/bfs/static/laputa-search/client/assets/nodata.67f7a1c9.png'),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 36),
                            child: Text(
                              '空空如也~',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.4)),
                            ),
                          )
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var playRes = playList[index];
                          return Container(
                            margin: EdgeInsets.only(top: index == 0 ? 12 : 0),
                            color: index % 2 == 0
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant
                                    .withOpacity(0.2),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            child: Row(children: [
                              playRes == ref.read(currentPlayingRes)
                                  ? Container(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        const IconData(
                                          0xe668,
                                          fontFamily: "Icon",
                                        ),
                                        size: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  playRes.title,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          playRes == ref.read(currentPlayingRes)
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onBackground
                                                  .withOpacity(0.8)),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  playRes.artist,
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.4)),
                                ),
                              )
                            ]),
                          );
                        },
                        itemCount: playList.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
