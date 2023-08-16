import 'package:bilimusic/api/collect_api.dart';
import 'package:bilimusic/api/common_api.dart';
import 'package:bilimusic/api/fav_api.dart';
import 'package:bilimusic/models/home/fav_resc.dart';

import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:bilimusic/utils/log.dart';

import 'package:bilimusic/utils/play.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

enum PlayListType { cids, folders, favorites, local }

class AsyncPlayListNotifier
    extends AutoDisposeFamilyAsyncNotifier<PlayListModel, (String, int)> {
  final List<PlayMedia> playMediaList = [];
  Isar isar = Isar.getInstance()!;

  _initFromFolders() async {
    final collectMedias = await CollectApi.getCollectMedias(arg.$2);
    for (var element in collectMedias.medias) {
      playMediaList.add(PlayMedia(
        intro: "av${element.id}",
        title: element.title,
        author: element.upper.name,
        cover: element.cover,
        aid: element.id,
        duration: element.duration,
        cid: null,
      ));
    }
    return PlayListModel(
        type: arg.$1,
        id: arg.$2,
        cover: collectMedias.info.cover,
        title: collectMedias.info.title,
        author: collectMedias.info.upper.name,
        mediaCount: collectMedias.medias.length,
        desc: collectMedias.info.intro,
        medias: collectMedias.medias
            .map((e) => PlayMedia(
                aid: arg.$2,
                cid: null,
                title: e.title,
                author: e.upper.name,
                cover: e.cover,
                duration: e.duration,
                intro: "av${e.id}"))
            .toList());
  }

  _initFromFavorites() async {
    final List<FavMedia> favVideos = [];
    int page = 1;
    final favInfoResp = await FavApi.getFavRescList(arg.$2, pn: 1);
    bool hasMore = favInfoResp.hasMore;
    favVideos.addAll(favInfoResp.medias);
    while (hasMore) {
      page++;
      final favInfoResp = await FavApi.getFavRescList(arg.$2, pn: page);
      favVideos.addAll(favInfoResp.medias);
      hasMore = favInfoResp.hasMore;
    }
    for (var element in favVideos) {
      playMediaList.add(PlayMedia(
        intro: element.intro,
        title: element.title,
        author: element.upper.name,
        cover: element.cover,
        aid: element.id,
        duration: element.duration,
        cid: null,
      ));
    }
    return PlayListModel(
        type: arg.$1,
        id: arg.$2,
        cover: favInfoResp.info.cover,
        title: favInfoResp.info.title,
        author: favInfoResp.info.upper.name,
        mediaCount: favInfoResp.info.mediaCount,
        desc: favInfoResp.info.intro,
        medias: favVideos
            .map((e) => PlayMedia(
                aid: arg.$2,
                cid: null,
                title: e.title,
                author: e.upper.name,
                cover: e.cover,
                duration: e.duration,
                intro: "av${e.id}"))
            .toList());
  }

  _initFromCids() async {
    final videoInfoResp = await CommonApi.getVideoInfo(aid: arg.$2);
    for (var element in videoInfoResp.pages!) {
      playMediaList.add(PlayMedia(
        intro: videoInfoResp.desc!,
        title: element.part!,
        author: videoInfoResp.owner!.name!,
        cover: videoInfoResp.pic!,
        aid: arg.$2,
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
                aid: arg.$2,
                cid: e.cid.toString(),
                title: e.part!,
                author: videoInfoResp.owner!.name!,
                cover: videoInfoResp.pic!,
                duration: e.duration!,
                intro: videoInfoResp.tname!))
            .toList());
  }

  _initFromLocal() async {
    final medias = isar.playMedias.where().findAllSync().reversed.toList();
    Log.e(medias, 'meedias');
    for (var element in medias) {
      playMediaList.add(element);
    }
    // return medias;
    return PlayListModel(
        type: arg.$1,
        id: arg.$2,
        cover: medias.isEmpty
            ? "https://i0.hdslb.com/bfs/manga-static/manga-pc/static/img/empty-image.bea10bfe88.png"
            : medias.first.cover,
        title: "本地收藏夹",
        author: "本地收藏夹",
        mediaCount: medias.length,
        desc: "数据仅本地存储，不会被同步~",
        medias: medias);
  }

  @override
  Future<PlayListModel> build(arg) async {
    //根据 arg.$1 查找类型

    final type =
        PlayListType.values.firstWhere((element) => element.name == arg.$1);
    switch (type) {
      case PlayListType.cids:
        return await _initFromCids();
      case PlayListType.folders:
        return await _initFromFolders();
      case PlayListType.favorites:
        return await _initFromFavorites();
      case PlayListType.local:
        return await _initFromLocal();
    }
  }

  playMedia(index) {
    Player().play(playMediaList, index: index);
  }
}

final playListProvider = AsyncNotifierProvider.autoDispose
    .family<AsyncPlayListNotifier, PlayListModel, (String, int)>(
        () => AsyncPlayListNotifier());
