import 'dart:ui';

import 'package:bilimusic/screen/play_list/play_list_provider.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayListMobileScreen extends StatefulHookConsumerWidget {
  const PlayListMobileScreen(this.type, this.id, this.title, {super.key});
  final String type;
  final int id;
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayListMobileScreenState();
}

class _PlayListMobileScreenState extends ConsumerState<PlayListMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController(keepScrollOffset: true);
    final provider = playListProvider((widget.type, widget.id));
    final asyncPlayListModel = ref.watch(provider);
    final toolBarTransparenct = useState(true);
    useEffect(() {
      scrollEvent() {
        if (scrollController.offset > 40) {
          toolBarTransparenct.value = false;
        } else {
          toolBarTransparenct.value = true;
        }
      }

      scrollController.addListener(scrollEvent);
      // _player = AudioPlayer(userAgent: ApiConstants.userAgent);
      return () {
        scrollController.removeListener(scrollEvent);
      };
    }, []);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: toolBarTransparenct.value ? null : Text(widget.title),
          foregroundColor: Colors.white,
          backgroundColor: toolBarTransparenct.value
              ? Colors.transparent
              : Colors.black.withOpacity(0.6),
          titleSpacing: 0,
        ),
        body: asyncPlayListModel.when(
          data: (data) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 260,
                  child: Stack(
                    children: [
                      Container(
                        constraints: const BoxConstraints.expand(
                            width: double.infinity, height: double.infinity),
                        child: CachedNetworkImage(
                          imageUrl: data.cover,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(
                            width: double.infinity, height: 260),
                        color: Colors.black.withOpacity(0.42),
                      ),
                      ClipRRect(
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                            child: Container(
                              height: 260,
                            )),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 72,
                        left: 16,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: CachedNetworkImage(
                                    imageUrl: data.cover,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 110,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.person_2,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  data.author,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white
                                                          .withOpacity(0.8)),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "共 ${data.mediaCount} 个媒体文件",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white
                                                    .withOpacity(0.6)),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                        ),
                      )
                    ],
                  ),
                )),
                SliverList.builder(
                  itemBuilder: (context, index) {
                    final media = data.medias[index];
                    return ListTile(
                      title: Text(
                        media.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                      leading: Text(
                        index.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                      minLeadingWidth: 12,
                      subtitle: Text(media.author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.5))),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 20,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                        ),
                        onPressed: () {},
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 20, top: 2, bottom: 2, right: 0),
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      onTap: () {
                        ref.read(provider.notifier).playMedia(index);
                      },
                    );
                  },
                  itemCount: data.medias.length,
                )
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (err, stack) {
            Log.e(stack, err.toString());
            return Text('Error: $err');
          },
        ));
  }
}
