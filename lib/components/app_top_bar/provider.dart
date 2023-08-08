import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBarState {
  final bool showBack;
  final String title;
  final String key;

  TopBarState({this.showBack = false, this.title = "", this.key = ""});
}

class TopBarStateNotifier extends Notifier<List<TopBarState>> {
  @override
  List<TopBarState> build() {
    return [TopBarState()];
  }

  void pushState(TopBarState topBarState) {
    state = [...state, topBarState];
  }

  void popState() {
    state.removeLast();
    state = [...state];
  }

  void replace(TopBarState topBarState) {
    state.removeLast();
    state = [...state, topBarState];
  }

  void go(TopBarState topBarState) {
    if (topBarState.key == state.last.key) {
      replace(topBarState);
    } else {
      pushState(topBarState);
    }
  }

  void clear() {
    state = [TopBarState()];
  }
}

final topbarStateProvider =
    NotifierProvider<TopBarStateNotifier, List<TopBarState>>(
        () => TopBarStateNotifier());
