import 'package:bilimusic/screen/play_list/play_list_desktop_screen.dart';
import 'package:bilimusic/screen/play_list/play_list_mobile_screen.dart';
import 'package:bilimusic/utils/misc.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayListScreen extends StatefulHookConsumerWidget {
  const PlayListScreen(this.type, this.id, {super.key, this.title});
  final String type;
  final int id;
  final String? title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends ConsumerState<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return MiscUtil.isDesktop()
        ? PlayListDesktopScreenState(widget.type, widget.id)
        : PlayListMobileScreen(widget.type, widget.id, widget.title!);
  }
}
