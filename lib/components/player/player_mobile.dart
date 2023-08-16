import 'package:bilimusic/components/player/player_proivder.dart';

import 'package:bilimusic/screen/playing/playing_mobile_screen.dart';
import 'package:bilimusic/utils/play.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayerMobileComponent extends StatefulHookConsumerWidget {
  const PlayerMobileComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerMobileComponentState();
}

class _PlayerMobileComponentState extends ConsumerState<PlayerMobileComponent> {
  final coverWidth = 52.0;
  @override
  Widget build(BuildContext context) {
    final provider = playerComponentProvider(Player());
    final playerModel = ref.watch(provider);

    return Material(
        child: GestureDetector(
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(50),
              color: Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withOpacity(0.4)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: playerModel.media != null
                      ? CachedNetworkImage(
                          imageUrl: playerModel.media!.cover,
                          width: coverWidth,
                          height: coverWidth,
                          // memCacheWidth: 36,
                          // memCacheHeight: 36,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: coverWidth,
                          height: coverWidth,
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(0.1))),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 14),
                    height: coverWidth - 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          playerModel.media != null
                              ? playerModel.media!.title
                              : '未播放',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          playerModel.media != null
                              ? playerModel.media!.author
                              : 'Hi~',
                          style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer
                                  .withOpacity(0.5)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                width: 36,
                height: 36,
                child: IconButton.filled(
                  onPressed: ref.read(provider.notifier).playHandler,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.tertiaryContainer),
                  ),
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    playerModel.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 6),
                width: 36,
                height: 36,
                child: IconButton(
                  onPressed: ref.read(provider.notifier).playNextHandler,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.skip_next,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
              )
            ],
          )),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const PlayingMobileScreen();
          },
          isScrollControlled: true,
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              maxHeight: MediaQuery.of(context).size.height),
          // enableDrag: false,
        );
      },
    ));
  }
}
