import 'package:bilimusic/api/common_api.dart';
import 'package:bilimusic/models/common/related_video.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelatedVideosNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Datum>, dynamic> {
  @override
  build(arg) {
    return CommonApi.getRelatedVideos(aid: arg);
  }
}

final relatedVideosProvider = AsyncNotifierProvider.autoDispose
    .family<RelatedVideosNotifier, List<Datum>, dynamic>(
        RelatedVideosNotifier.new);
