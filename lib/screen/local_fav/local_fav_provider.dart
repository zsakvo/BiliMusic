import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class LocalFavItemsNotifier extends StateNotifier<List<PlayMedia>> {
  Isar isar = Isar.getInstance()!;
  LocalFavItemsNotifier() : super([]) {
    state = isar.playMedias.where().findAllSync().reversed.toList();
  }

  addItem(PlayMedia res) {
    state = [res, ...state];
    isar.writeTxnSync(() {
      for (var item in state) {
        isar.playMedias.putSync(item);
      }
    });
  }

  removeItem(PlayMedia res) {
    final delRes =
        state.firstWhere((element) => element.mediaId == res.mediaId);
    state.remove(delRes);
    state = [...state];

    isar.writeTxnSync(() {
      isar.playRes.deleteSync(delRes.id);
    });
  }

  toggleItem(PlayMedia res) {
    if (state.where((element) => element.mediaId == res.mediaId).isEmpty) {
      addItem(res);
    } else {
      // removeItem(res);
    }
  }

  isFav(String? id) {
    if (id == null) return false;
    return state.where((element) => element.mediaId == id).isNotEmpty;
  }
}

final localFavItemsProvider =
    StateNotifierProvider<LocalFavItemsNotifier, List<PlayMedia>>((ref) {
  return LocalFavItemsNotifier();
});
