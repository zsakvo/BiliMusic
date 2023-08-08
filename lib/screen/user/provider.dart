import 'package:bilimusic/api/user_api.dart';
import 'package:bilimusic/models/user/user_card.dart';
import 'package:bilimusic/models/user/user_video.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageProvider = Provider<int>((ref) {
  return 1;
});

final userCardProvider = FutureProvider.autoDispose
    .family<UserCardResponseData, dynamic>((ref, mid) async {
  return UserApi.userCard(mid);
});

final userVideosProvider =
    FutureProvider.autoDispose.family<List<Vlist>, dynamic>((ref, mid) async {
  await ref.watch(userCardProvider(mid).future);
  return UserApi.userVideos(mid, pn: ref.watch(currentPageProvider));
});

// 使用 statefulNotifier 组合上面的状态

