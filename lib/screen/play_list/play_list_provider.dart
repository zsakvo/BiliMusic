import 'package:bilimusic/api/common_api.dart';

import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:bilimusic/utils/play.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncPlayListNotifier
    extends AutoDisposeFamilyAsyncNotifier<PlayListModel, (String, int)> {
  final List<PlayMedia> playMediaList = [];

  @override
  Future<PlayListModel> build(arg) async {
    final videoInfoResp = await CommonApi.getVideoInfo(aid: arg.$2);
    Log.e(videoInfoResp.title);
    for (var element in videoInfoResp.pages!) {
      playMediaList.add(PlayMedia(
        intro: videoInfoResp.desc!,
        title: element.part!,
        author: videoInfoResp.owner!.name!,
        cover: videoInfoResp.pic!,
        id: arg.$2,
        duration: element.duration!,
        cid: element.cid.toString(),
      ));
    }
    return PlayListModel(
        type: arg.$1,
        id: arg.$2,
        cover: videoInfoResp.pic!,
        title: videoInfoResp.title!,
        author: videoInfoResp.owner!.name!,
        mediaCount: videoInfoResp.videos!,
        desc: videoInfoResp.desc!,
        medias: videoInfoResp.pages!
            .map((e) => PlayMedia(
                id: arg.$2,
                cid: e.cid.toString(),
                title: e.part!,
                author: videoInfoResp.owner!.name!,
                cover: videoInfoResp.pic!,
                duration: e.duration!,
                intro: videoInfoResp.tname!))
            .toList());
  }

  playMedia(index) {
    Player().play(playMediaList, index: index);
  }
}

final playListProvider = AsyncNotifierProvider.autoDispose
    .family<AsyncPlayListNotifier, PlayListModel, (String, int)>(
        () => AsyncPlayListNotifier());
