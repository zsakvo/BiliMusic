// import 'package:bilimusic/components/player/provider.dart';
// import 'package:bilimusic/provider.dart';
// import 'package:bilimusic/screen/local_fav/local_fav_provider.dart';
// import 'package:bilimusic/utils/player.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class LocalFavScreen extends StatefulHookConsumerWidget {
//   const LocalFavScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LocalFavScreenState();
// }

// class _LocalFavScreenState extends ConsumerState<LocalFavScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final items = ref.watch(localFavItemsProvider);
//     final scrollController = useScrollController(keepScrollOffset: true);
//     final player = ref.watch(playerProvider);
//     final showMediumToolBar = useState(false);
//     return Material(
//       child: Builder(
//         builder: (context) {
//           return Stack(
//             children: [
//               CustomScrollView(
//                 controller: scrollController,
//                 slivers: [
//                   SliverToBoxAdapter(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 28, horizontal: 42),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(4),
//                             child: CachedNetworkImage(
//                               imageUrl: items.isEmpty
//                                   ? "https://i0.hdslb.com/bfs/manga-static/manga-pc/static/img/empty-image.bea10bfe88.png"
//                                   : items.first.cover,
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 24),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "共${items.length}首音乐",
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onBackground
//                                           .withOpacity(0.5),
//                                       height: 1.8),
//                                 ),
//                                 Text(
//                                   "当前数据仅本地存储，不会被同步到云端",
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onBackground
//                                           .withOpacity(0.5),
//                                       height: 1.8),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 12),
//                                   child: FilledButton.icon(
//                                       onPressed: () {
//                                         // PlayerUtils.playList(
//                                         //     player, ref, items);
//                                       },
//                                       icon: const Icon(
//                                         Icons.play_circle_outline_outlined,
//                                         size: 22,
//                                       ),
//                                       label: const Text("播放全部")),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   items.isEmpty
//                       ? SliverToBoxAdapter(
//                           child: SizedBox(
//                             height: MediaQuery.of(context).size.height - 420,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CachedNetworkImage(
//                                     width: 360,
//                                     imageUrl:
//                                         'https://s1.hdslb.com/bfs/static/laputa-search/client/assets/nodata.67f7a1c9.png'),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 12, bottom: 36),
//                                   child: Text(
//                                     '今天真是寂寞如雪啊~',
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onBackground
//                                             .withOpacity(0.4)),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       : SliverList.builder(
//                           itemBuilder: (context, index) {
//                             final PlayRes res = items[index];
//                             return Container(
//                               color: index % 2 == 0
//                                   ? Theme.of(context).colorScheme.background
//                                   : Theme.of(context)
//                                       .colorScheme
//                                       .surfaceVariant
//                                       .withOpacity(0.2),
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 42),
//                               child: InkWell(
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(4),
//                                       child: CachedNetworkImage(
//                                         imageUrl: res.cover,
//                                         width: 42,
//                                         height: 42,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 6,
//                                       child: Container(
//                                         padding: const EdgeInsets.only(
//                                             left: 12, right: 28),
//                                         child: Text(
//                                           res.title,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                               fontSize: 16,
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .onBackground
//                                                   .withOpacity(0.8)),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 1,
//                                       child: Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           res.artist,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .onBackground
//                                                   .withOpacity(0.4)),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 1,
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           "av${res.aid}",
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .onBackground
//                                                   .withOpacity(0.4)),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 onTap: () {
//                                   PlayerUtils.playList(player, ref, items,
//                                       initialIndex: index);
//                                 },
//                               ),
//                             );
//                           },
//                           itemCount: items.length,
//                         ),
//                 ],
//               ),
//               Positioned(
//                 left: 0,
//                 top: 0,
//                 child: showMediumToolBar.value
//                     ? Container(
//                         decoration: BoxDecoration(
//                             color: Theme.of(context).colorScheme.background,
//                             border: Border(
//                                 bottom: BorderSide(
//                                     width: 0.7,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .primaryContainer))),
//                         alignment: Alignment.centerLeft,
//                         width: MediaQuery.of(context).size.width,
//                         padding:
//                             const EdgeInsets.only(left: 18, top: 12, bottom: 8),
//                         // height: 120,
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   PlayerUtils.playList(
//                                     player,
//                                     ref,
//                                     items,
//                                   );
//                                 },
//                                 icon: Icon(
//                                   Icons.play_circle,
//                                   size: 30,
//                                   color: Theme.of(context).colorScheme.primary,
//                                 )),
//                             // IconButton(
//                             //     onPressed: () {
//                             //       MiscUtil.share("");
//                             //     },
//                             //     icon: Icon(
//                             //       Icons.share,
//                             //       size: 20,
//                             //       color: Theme.of(context)
//                             //           .colorScheme
//                             //           .onBackground
//                             //           .withOpacity(0.6),
//                             //     ))
//                           ],
//                         ),
//                       )
//                     : const SizedBox.shrink(),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
