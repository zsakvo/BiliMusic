import 'package:bilimusic/components/player/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class LocalFavItemsNotifier extends StateNotifier<List<PlayRes>> {
  Isar isar = Isar.getInstance()!;
  LocalFavItemsNotifier() : super([]) {
    state = isar.playRes.where().findAllSync().reversed.toList();
  }

  addItem(PlayRes res) {
    state = [res, ...state];
    isar.writeTxnSync(() {
      for (var item in state) {
        isar.playRes.putSync(item);
      }
    });
  }

  removeItem(PlayRes res) {
    final delRes =
        state.firstWhere((element) => element.mediaItem.id == res.mediaItem.id);
    state.remove(delRes);
    state = [...state];

    isar.writeTxnSync(() {
      isar.playRes.deleteSync(delRes.id);
    });
  }

  toggleItem(PlayRes res) {
    if (state
        .where((element) => element.mediaItem.id == res.mediaItem.id)
        .isEmpty) {
      addItem(res);
    } else {
      removeItem(res);
    }
  }

  isFav(String? id) {
    if (id == null) return false;
    return state.where((element) => element.mediaItem.id == id).isNotEmpty;
  }
}

final localFavItemsProvider =
    StateNotifierProvider<LocalFavItemsNotifier, List<PlayRes>>((ref) {
  return LocalFavItemsNotifier();
});
