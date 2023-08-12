import 'dart:ui';

import 'package:bilimusic/components/player/player_model.dart';
import 'package:bilimusic/components/player/provider.dart';

import 'package:bilimusic/screen/playing/component/related_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayingScreen extends StatefulHookConsumerWidget {
  const PlayingScreen(this.playerModel, {super.key});
  final PlayerModel playerModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends ConsumerState<PlayingScreen> {
  @override
  Widget build(BuildContext context) {
    // final currentPlaying = ref.watch(currentPlayingRes);
    final computedHeight = MediaQuery.of(context).size.height - 80;
    final currentMedia = widget.playerModel.media;
    return Material(
        child: currentMedia != null
            ? Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints.expand(
                        width: double.infinity, height: double.infinity),
                    child: CachedNetworkImage(
                      imageUrl: currentMedia.cover,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints.expand(
                        width: double.infinity, height: double.infinity),
                    color: Colors.black.withOpacity(0.64),
                  ),
                  BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                      child: Container(
                        height: computedHeight * 0.8,
                        margin: EdgeInsets.only(
                          top: computedHeight * 0.1,
                        ),
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 4,
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: currentMedia.cover,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height: constraints.maxHeight * 0.4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 64),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              currentMedia.title.trim(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Text(currentMedia.author,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white70)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Text((currentMedia.introLine),
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                height: 1.6,
                                                fontSize: 13,
                                                color: Colors.white70)),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       top: 64, bottom: 16),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.start,
                                      //     children: [
                                      //       Padding(
                                      //         padding: const EdgeInsets.only(
                                      //             right: 24),
                                      //         child: TextButton.icon(
                                      //             onPressed: () {},
                                      //             style: TextButton.styleFrom(
                                      //               backgroundColor:
                                      //                   Colors.white24,
                                      //             ),
                                      //             icon: Icon(
                                      //               Icons
                                      //                   .favorite_border_outlined,
                                      //               color: Theme.of(context)
                                      //                   .colorScheme
                                      //                   .onPrimary
                                      //                   .withOpacity(0.7),
                                      //             ),
                                      //             label: const Text("收藏",
                                      //                 style: TextStyle(
                                      //                     color: Colors
                                      //                         .white70))),
                                      //       ),
                                      //       Padding(
                                      //           padding:
                                      //               const EdgeInsets.only(
                                      //                   right: 32),
                                      //           child: TextButton.icon(
                                      //               onPressed: () {},
                                      //               style:
                                      //                   TextButton.styleFrom(
                                      //                 backgroundColor:
                                      //                     Colors.white24,
                                      //               ),
                                      //               icon: Icon(
                                      //                 Icons.arrow_downward,
                                      //                 color: Theme.of(context)
                                      //                     .colorScheme
                                      //                     .onPrimary
                                      //                     .withOpacity(0.7),
                                      //               ),
                                      //               label: const Text("下载",
                                      //                   style: TextStyle(
                                      //                       color: Colors
                                      //                           .white70)))),
                                      //       // const Spacer(),
                                      //       InkWell(
                                      //         child: Row(
                                      //           children: [
                                      //             const Text("更多媒体",
                                      //                 style: TextStyle(
                                      //                     fontSize: 14,
                                      //                     color: Colors
                                      //                         .white70)),
                                      //             Icon(
                                      //               Icons
                                      //                   .arrow_forward_outlined,
                                      //               size: 18,
                                      //               color: Theme.of(context)
                                      //                   .colorScheme
                                      //                   .onPrimary
                                      //                   .withOpacity(0.7),
                                      //             )
                                      //           ],
                                      //         ),
                                      //         onTap: () {},
                                      //       )
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
                                );
                              },
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Expanded(
                              flex: 14,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: computedHeight * 0.80,
                                      color: Colors.transparent,
                                      child:
                                          // const LyricComponent()
                                          RelatedScreen(
                                              widget.playerModel.media!.id))
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 4,
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    left: 32,
                    top: 48,
                    child: IconButton.outlined(
                        onPressed: () {
                          ref.read(playerDetailControllerProvider)!.close();
                          ref
                              .read(playerDetailControllerProvider.notifier)
                              .state = null;
                        },
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )),
                  )
                ],
              )
            : const Text("尚未播放"));
  }
}
