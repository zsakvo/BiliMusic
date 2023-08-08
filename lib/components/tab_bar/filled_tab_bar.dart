import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilledTabBar extends StatefulHookConsumerWidget {
  const FilledTabBar(
      {super.key,
      required this.tabController,
      required this.tabs,
      this.indent = 0,
      this.endIndent = 0});
  final TabController tabController;
  final List<String> tabs;
  final double indent;
  final double endIndent;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilledTabBarState();
}

class _FilledTabBarState extends ConsumerState<FilledTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.7,
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.4)))),
      child: Row(
        children: [
          Container(
            width: widget.tabs.join("").length * 18 +
                32 * widget.tabs.length.toDouble() +
                widget.indent +
                widget.endIndent,
            padding:
                EdgeInsets.only(left: widget.indent, right: widget.endIndent),
            child: TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              controller: widget.tabController,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              tabs: widget.tabs.map((e) => Tab(text: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
