import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bilimusic/components/player/player_proivder.dart';
import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/config/config_screen.dart';
import 'package:bilimusic/screen/home/home_screen_desktop.dart';
import 'package:bilimusic/screen/playing/playing_screen.dart';
import 'package:bilimusic/utils/play.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MusicPlayer extends StatefulHookConsumerWidget {
  const MusicPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MusicPlayerState();
}

class MusicPlayerState extends ConsumerState<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    final provider = playerComponentProvider(Player());
    final playerModel = ref.watch(provider);

    final homeKey = ref.watch(homeScaffoldKey);

    bool dragEnd = true;

    final showThumb = useState(false);

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

    final loopAll = useState(true);

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
                  playerModel.media == null
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
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: CachedNetworkImage(
                                            imageUrl: playerModel.media!.cover,
                                            fit: BoxFit.cover,
                                          )),
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
                                            return PlayingScreen(playerModel);
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
                                            playerModel.media!.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: colorOnBackground),
                                          )),
                                          Text(
                                              "\t\t\t${playerModel.media!.author}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: colorSecondary
                                                    .withOpacity(0.4),
                                              ))
                                        ],
                                      ),
                                      Text(
                                        "${playerModel.progressText} / ${playerModel.totalText}",
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
                            onPressed:
                                ref.read(provider.notifier).playPreviousHandler,
                            icon: Icon(
                              Icons.skip_previous,
                              color: colorMain,
                              size: 24,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: IconButton(
                              onPressed: () =>
                                  ref.read(provider.notifier).playHandler(),
                              icon: Icon(
                                playerModel.isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                color: colorMain,
                                size: 46,
                              )),
                        ),
                        IconButton(
                            onPressed:
                                ref.read(provider.notifier).playNextHandler,
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
                                onPressed:
                                    ref.read(provider.notifier).favoriteHandler,
                                icon: Icon(
                                  playerModel.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 24,
                                  color: playerModel.isFavorite
                                      ? colorMain
                                      : colorOnBackground,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: IconButton(
                                  onPressed: ref
                                      .read(provider.notifier)
                                      .toggleLoopMode,
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
                      if (playerModel.media != null) showThumb.value = true;
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
                          playerModel.media == null ? Colors.transparent : null,
                      thumbCanPaintOutsideBar: true,
                      buffered: playerModel.buffered,
                      progress: playerModel.progress,
                      total: playerModel.total,
                      onDragStart: (details) {
                        if (playerModel.media == null) return;
                        dragEnd = false;
                        ref.read(provider.notifier).onProgressBarDragStart();
                      },
                      onDragEnd: () {
                        dragEnd = true;
                        ref.read(provider.notifier).onProgressBarDragEnd();
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
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
