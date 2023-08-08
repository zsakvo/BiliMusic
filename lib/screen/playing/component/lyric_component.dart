import 'dart:async';

import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/screen/playing/component/lyric_provider.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:bilimusic/utils/lyric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class LyricComponent extends StatefulHookConsumerWidget {
  const LyricComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LyricComponentState();
}

class LyricComponentState extends ConsumerState<LyricComponent> {
  @override
  Widget build(BuildContext context) {
    final lyric = ref.watch(lyricProvider);
    final scrollController = useScrollController(keepScrollOffset: true);
    final currentLine = ref.watch(currentLineProvider);
    final audioPlayer = ref.watch(playerProvider);
    final currentRes = ref.watch(currentPlayingRes);
    useEffect(() {
      Timer? timer;
      if (lyric.value != null) {
        final [_, lyricTimeLine as List<double>] = lyric.value!;
        timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
          if (audioPlayer.playerState.playing &&
              audioPlayer.playerState.processingState ==
                  ProcessingState.ready) {
            final ms = audioPlayer.position.inMilliseconds;
            final index = LyricUtils.findPositionIndex(lyricTimeLine, ms);
            // Log.e([ms, currentLine, index], "!!!!");
            if (index > currentLine) {
              // Log.e([56.0 * index - 56 * 2, scrollController.hasClients], "滚动");
              scrollController.animateTo(56.0 * index - 56 * 2,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn);
              ref.read(currentLineProvider.notifier).state = index;
            }
          }
        });
      }

      return () {
        // Future(() => ref.read(currentLineProvider.notifier).state = 0);
        timer?.cancel();
      };
    }, [lyric.value]);

    useEffect(() {
      Future(() => ref.read(currentLineProvider.notifier).state = 0);
      return () => {};
    }, [currentRes]);

    useEffect(() {
      if (lyric.value != null) {
        final [_, lyricTimeLine as List<double>] = lyric.value!;
        final ms = audioPlayer.position.inMilliseconds;
        Future(() {
          final index = LyricUtils.findPositionIndex(lyricTimeLine, ms);
          ref.read(currentLineProvider.notifier).state = index;
          if (scrollController.hasClients) {
            scrollController.animateTo(56.0 * index - 56 * 2,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn);
          }
        });
      }
      return () => {};
    }, [lyric.value]);

    return Material(
        color: Colors.transparent,
        child: lyric.when(data: (data) {
          final [lyricLines as List<String>, _] = data;
          return lyricLines.isNotEmpty
              ? ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    controller: scrollController,
                    itemExtent: 56,
                    itemBuilder: (context, index) {
                      final line = lyricLines[index];
                      return Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          line,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24,
                              color: currentLine == index
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withOpacity(0.3)),
                        ),
                      );
                    },
                    itemCount: lyricLines.length,
                  ))
              : Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 64),
                  child: const Text(
                    "暂无字幕",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                );
        }, error: (err, stack) {
          Log.e(err, "LyricComponent");
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 64),
            child: const Text(
              "暂无字幕",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          );
        }, loading: () {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 64),
            child: const Text(
              "加载中……",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          );
        }));
  }
}
