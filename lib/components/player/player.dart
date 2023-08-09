import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/config/config_screen.dart';
import 'package:bilimusic/screen/home/home_screen.dart';
import 'package:bilimusic/screen/local_fav/local_fav_provider.dart';
import 'package:bilimusic/screen/playing/playing_screen.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class MusicPlayer extends StatefulHookConsumerWidget {
  const MusicPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MusicPlayerState();
}

class MusicPlayerState extends ConsumerState<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    final cover = useState<String?>(null);
    final title = useState("");
    final artist = useState("");
    final allSeconds = useState<int>(0);
    final currentSeconds = useState<int>(0);
    final bufferedSeconds = useState<int>(0);
    final allPosition = useState("");
    final currentPosition = useState("");
    final audioPlayer = ref.watch(playerProvider);
    final isPlaying = ref.watch(playerStateProvider);
    final homeKey = ref.watch(homeScaffoldKey);
    final currentId = useState<String?>(null);
    final localFavItems = ref.watch(localFavItemsProvider);
    bool dragEnd = true;

    final showThumb = useState(false);

    final isFav = useMemoized(
        () => ref.read(localFavItemsProvider.notifier).isFav(currentId.value),
        [currentId.value, localFavItems]);

    final playerDetailController = ref.watch(playerDetailControllerProvider);

    final colorIndex = ref.watch(themeColorProvider);
    final colorScheme = useMemoized(
        () => ColorScheme.fromSeed(seedColor: ColorThemes[colorIndex]),
        [colorIndex]);
    final colorOnBackground = useMemoized(() {
      if (playerDetailController != null) {
        return colorScheme.onPrimary.withOpacity(0.8);
      } else {
        return colorScheme.onBackground.withOpacity(0.8);
      }
    }, [playerDetailController, colorScheme]);
    final colorSecondary = useMemoized(() {
      if (playerDetailController != null) {
        return colorScheme.onPrimary.withOpacity(0.8);
      } else {
        return colorScheme.onBackground.withOpacity(0.8);
      }
    }, [playerDetailController, colorScheme]);
    final colorMain = useMemoized(() {
      if (playerDetailController != null) {
        return colorScheme.primaryContainer;
      } else {
        return colorScheme.primary;
      }
    }, [playerDetailController, colorIndex]);

    final currentIndex = useState(0);
    final loopAll = useState(true);

    useEffect(() {
      audioPlayer.positionStream.listen((event) {
        currentSeconds.value = event.inMilliseconds;
        currentPosition.value =
            StringFormatUtils.timeLengthFormat(event.inSeconds);
        allSeconds.value = audioPlayer.duration?.inMilliseconds ?? 0;
        if (audioPlayer.duration != null) {
          allPosition.value = StringFormatUtils.timeLengthFormat(
              audioPlayer.duration?.inSeconds ?? 0);
        }
      });
      audioPlayer.bufferedPositionStream.listen((event) {
        bufferedSeconds.value = event.inMilliseconds;
      });
      audioPlayer.sequenceStateStream.listen(
        (event) {
          currentId.value = event?.currentSource?.tag?.id;
          MediaItem? item = event?.currentSource?.tag;

          currentIndex.value = event?.currentIndex ?? 0;
          if (item == null) {
            cover.value = null;
          } else {
            cover.value = item.artUri.toString();
            title.value = item.title;
            artist.value = item.artist!;
          }
        },
      );
      audioPlayer.currentIndexStream.listen((event) {
        ref.read(currentPlayingRes.notifier).state =
            event == null ? null : ref.read(playResProvider)[event];
        ref.read(currentPlayingIndex.notifier).state = event ?? 0;
      });
      audioPlayer.playerStateStream.listen((event) async {
        ref.read(playerStateProvider.notifier).state = event.playing;
        switch (event.processingState) {
          case ProcessingState.buffering:
            break;
          case ProcessingState.ready:
            break;
          case ProcessingState.loading:
            break;
          case ProcessingState.completed:
            break;
          case ProcessingState.idle:
            break;
        }
      });

      return () {
        audioPlayer.stop();
        audioPlayer.dispose();
      };
    }, []);

    final list = ref.read(playResProvider);
    final currentRes = list.isNotEmpty ? list[currentIndex.value] : null;
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 88,
        // color: Theme.of(context).colorScheme.primary.withOpacity(0.03),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  title.value.isEmpty
                      ? const Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 80,
                          ),
                        )
                      : Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Row(
                              children: [
                                Container(
                                    width: 48,
                                    height: 48,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: InkWell(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: cover.value != null
                                            ? CachedNetworkImage(
                                                imageUrl:
                                                    cover.value!.toString(),
                                                fit: BoxFit.cover,
                                              )
                                            : Container(
                                                color: Colors.grey[150],
                                              ),
                                      ),
                                      onTap: () {
                                        // 待实现
                                        if (playerDetailController == null) {
                                          ref
                                                  .read(
                                                      playerDetailControllerProvider
                                                          .notifier)
                                                  .state =
                                              homeKey
                                                  .currentState!
                                                  .showBottomSheet((context) {
                                            return const PlayingScreen();
                                          },
                                                      enableDrag: false,
                                                      constraints:
                                                          const BoxConstraints
                                                                  .expand(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity));
                                        } else {
                                          playerDetailController.close();
                                          ref
                                              .read(
                                                  playerDetailControllerProvider
                                                      .notifier)
                                              .state = null;
                                        }
                                      },
                                    )),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                              child: Text(
                                            title.value,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: colorOnBackground),
                                          )),
                                          Text("\t\t\t${artist.value}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: colorSecondary
                                                    .withOpacity(0.4),
                                              ))
                                        ],
                                      ),
                                      Text(
                                        "${currentPosition.value} / ${allPosition.value}",
                                        style: TextStyle(
                                            height: 1.8,
                                            color:
                                                colorSecondary.withOpacity(0.4),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (currentId.value == null) {
                                return;
                              }
                              audioPlayer.seekToPrevious();
                            },
                            icon: Icon(
                              Icons.skip_previous,
                              color: colorMain,
                              size: 24,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: IconButton(
                              onPressed: () async {
                                if (currentId.value == null) {
                                  return;
                                }
                                ref.read(playerStateProvider.notifier).state =
                                    !isPlaying;
                                isPlaying
                                    ? audioPlayer.pause()
                                    : audioPlayer.play();
                              },
                              icon: Icon(
                                isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                color: colorMain,
                                size: 46,
                              )),
                        ),
                        IconButton(
                            onPressed: () {
                              if (currentId.value == null) {
                                return;
                              }
                              audioPlayer.seekToNext();
                            },
                            icon: Icon(
                              Icons.skip_next,
                              color: colorMain,
                              size: 24,
                            ))
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: IconButton(
                                onPressed: () {
                                  if (currentRes == null) {
                                    return;
                                  }

                                  ref
                                      .read(localFavItemsProvider.notifier)
                                      .toggleItem(currentRes);
                                },
                                icon: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 24,
                                  color: isFav ? colorMain : colorOnBackground,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: IconButton(
                                  onPressed: () {
                                    if (!loopAll.value) {
                                      audioPlayer.setLoopMode(LoopMode.all);
                                      loopAll.value = true;
                                    } else {
                                      audioPlayer.setLoopMode(LoopMode.one);
                                      loopAll.value = false;
                                    }
                                  },
                                  icon: Icon(
                                    loopAll.value
                                        ? Icons.repeat
                                        : Icons.repeat_one,
                                    size: 24,
                                    color: colorOnBackground,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: IconButton(
                                  onPressed: () {
                                    homeKey.currentState!.isEndDrawerOpen
                                        ? homeKey.currentState!.closeEndDrawer()
                                        : homeKey.currentState!.openEndDrawer();
                                  },
                                  icon: Icon(
                                    Icons.format_list_bulleted,
                                    size: 24,
                                    color: colorOnBackground,
                                  )))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MouseRegion(
                    onEnter: (event) {
                      if (currentId.value != null) showThumb.value = true;
                    },
                    onExit: (event) {
                      if (dragEnd) showThumb.value = false;
                    },
                    child: ProgressBar(
                      barHeight: 3,
                      timeLabelLocation: TimeLabelLocation.none,
                      thumbRadius: 8,
                      thumbColor: showThumb.value ? null : Colors.transparent,
                      thumbGlowRadius: 14,
                      thumbGlowColor:
                          currentId.value == null ? Colors.transparent : null,
                      thumbCanPaintOutsideBar: true,
                      buffered: Duration(milliseconds: bufferedSeconds.value),
                      progress: Duration(milliseconds: currentSeconds.value),
                      total: Duration(milliseconds: allSeconds.value),
                      onDragStart: (details) {
                        if (currentId.value == null) return;
                        dragEnd = false;
                      },
                      onDragEnd: () {
                        if (currentId.value == null) {
                          audioPlayer.seek(const Duration(milliseconds: 0));
                        }
                        dragEnd = true;
                      },
                      onSeek: (duration) {
                        if (currentId.value == null) {
                          return;
                        }
                        audioPlayer.seek(duration);
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
