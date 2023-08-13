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
    final toolBarCollapsed = useState(false);
    useEffect(() {
      scrollEvent() {
        if (scrollController.offset > 40) {
          toolBarCollapsed.value = true;
        } else {
          toolBarCollapsed.value = false;
        }
      }

      scrollController.addListener(scrollEvent);
      // _player = AudioPlayer(userAgent: ApiConstants.userAgent);
      return () {
        scrollController.removeListener(scrollEvent);
      };
    }, []);
    return Scaffold(
        body: asyncPlayListModel.when(
      data: (data) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar.large(
              title: Text(widget.title),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  expandedTitleScale: 1.0,
                  titlePadding: EdgeInsets.only(
                      left: toolBarCollapsed.value ? 56 : 20, bottom: 12),
                  title: SizedBox(
                    height: toolBarCollapsed.value ? 36 : 60,
                    child: toolBarCollapsed.value
                        ? Text(
                            widget.title,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  widget.title,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                ),
                              ),
                              Text(
                                'UP：${data.author}\t,\t共${data.medias.length}个媒体',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5)),
                              )
                            ],
                          ),
                  )),
            ),
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
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      imageUrl: media.cover,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  minLeadingWidth: 12,
                  subtitle: Text("${media.author}\t\t\t${media.durationText}",
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
                  // visualDensity: VisualDensity.compact,
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
