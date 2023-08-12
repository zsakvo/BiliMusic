import 'package:bilimusic/models/common/related_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'related_media_provider.dart';

class RelatedScreen extends ConsumerStatefulWidget {
  const RelatedScreen(this.id, {super.key});

  final dynamic id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RelatedScreenState();
}

class _RelatedScreenState extends ConsumerState<RelatedScreen> {
  @override
  Widget build(BuildContext context) {
    final relatedVideos = ref.watch(relatedVideosProvider(widget.id));
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 32),
                  child: Text(
                    "推荐媒体",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
                Expanded(
                    child: relatedVideos.when(data: (data) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemExtent: 84,
                      itemBuilder: (context, index) {
                        Datum video = data[index];
                        return ListTile(
                          visualDensity:
                              const VisualDensity(vertical: 3), // to expand
                          leading: Image.network(
                            video.pic,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            video.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                          subtitle: Text(
                            video.owner.name,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.4)),
                          ),
                        );
                      },
                      itemCount: data.length);
                }, error: (error, stackTrace) {
                  return Center(
                    child: Text(error.toString()),
                  );
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }))
              ],
            ));
      },
    );
  }
}
