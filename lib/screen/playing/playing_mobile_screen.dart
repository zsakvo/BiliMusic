import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bilimusic/components/player/player_model.dart';
import 'package:bilimusic/components/player/player_proivder.dart';
import 'package:bilimusic/utils/play.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayingMobileScreen extends StatefulHookConsumerWidget {
  const PlayingMobileScreen(this.playerModel, {super.key});
  final PlayerModel playerModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayingMobileScreenState();
}

class _PlayingMobileScreenState extends ConsumerState<PlayingMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final provider = playerComponentProvider(Player());
    final playerModel = ref.watch(provider);
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Material(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48 + statusBarHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 0, top: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: playerModel.media!.cover,
                      width: screenWidth - 32,
                      height: screenWidth - 32,
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                width: screenWidth,
                padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
                child: Text(
                  playerModel.media!.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              Container(
                width: screenWidth,
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  playerModel.media!.author,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Container(
                width: screenWidth,
                padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
                child: ProgressBar(
                  barHeight: 3,
                  // timeLabelLocation: TimeLabelLocation.none,
                  timeLabelPadding: 14,
                  timeLabelTextStyle: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.secondary),
                  thumbRadius: 8,
                  // thumbColor: showThumb.value ? null : Colors.transparent,
                  thumbGlowRadius: 14,
                  // thumbGlowColor:
                  //     playerModel.media == null ? Colors.transparent : null,
                  thumbCanPaintOutsideBar: true,
                  buffered: playerModel.buffered,
                  progress: playerModel.progress,
                  total: playerModel.total,
                  onDragStart: (details) {
                    // if (playerModel.media == null) return;
                    // dragEnd = false;
                    // ref.read(provider.notifier).onProgressBarDragStart();
                  },
                  onDragEnd: () {
                    // dragEnd = true;
                    // ref.read(provider.notifier).onProgressBarDragEnd();
                  },
                  onSeek: (value) {
                    // Log.e("onSeek $value");
                    // Log.e([
                    //   playerModel.progress,
                    //   playerModel.total,
                    //   playerModel.buffered
                    // ]);
                    ref.read(provider.notifier).onProgressBarSeek(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          onPressed:
                              ref.read(provider.notifier).favoriteHandler,
                          icon: Icon(
                            playerModel.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          ),
                        )),
                    SizedBox(
                        width: 56,
                        height: 56,
                        child: IconButton(
                            onPressed:
                                ref.read(provider.notifier).playPreviousHandler,
                            icon: const Icon(
                              Icons.skip_previous,
                              size: 30,
                            ))),
                    Container(
                      width: 64,
                      height: 64,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: IconButton.filled(
                          onPressed: ref.read(provider.notifier).playHandler,
                          icon: Icon(
                            playerModel.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 36,
                          )),
                    ),
                    SizedBox(
                        width: 56,
                        height: 56,
                        child: IconButton(
                            onPressed:
                                ref.read(provider.notifier).playNextHandler,
                            icon: const Icon(
                              Icons.skip_next,
                              size: 30,
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconButton(
                          onPressed:
                              ref.read(provider.notifier).favoriteHandler,
                          icon: const Icon(
                            Icons.queue_music,
                            size: 26,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
