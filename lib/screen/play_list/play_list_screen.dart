import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'play_list_provider.dart';

class PlayListScreen extends ConsumerStatefulWidget {
  const PlayListScreen(this.type, this.id, {super.key});
  final String type;
  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends ConsumerState<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = playListProvider((widget.type, widget.id));
    final asyncPlayListModel = ref.watch(provider);

    // Let's render the todos in a scrollable list view
    return asyncPlayListModel.when(
      data: (playListModel) => Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 28, left: 42, right: 42, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: playListModel.cover,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${playListModel.author}\t·\t共${playListModel.mediaCount}首音乐",
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                playListModel.descLine,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5),
                                    height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 42),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 24),
                        child: FilledButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                            ),
                            onPressed: () {
                              ref.read(provider.notifier).playMedia(0);
                              // PlayerUtils.playList(
                              //     player, ref, playResList);
                            },
                            icon: const Icon(
                              Icons.play_circle_outline_outlined,
                              size: 22,
                            ),
                            label: const Text("播放全部")),
                      )
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  final video = playListModel.medias[index];
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
                              padding:
                                  const EdgeInsets.only(left: 12, right: 28),
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
                              alignment: Alignment.center,
                              child: Text(
                                video.author,
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
                              alignment: Alignment.center,
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
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                video.durationText,
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
                        ref.read(provider.notifier).playMedia(index);
                        // PlayerUtils.playList(player, ref, playResList,
                        //     initialIndex: index);
                      },
                    ),
                  );
                },
                itemCount: playListModel.medias.length,
              ),
            ],
          )
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
