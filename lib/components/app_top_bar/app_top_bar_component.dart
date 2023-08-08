import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'provider.dart';

class AppTopBar extends StatefulHookConsumerWidget {
  const AppTopBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppTopBarState();
}

class _AppTopBarState extends ConsumerState<AppTopBar> {
  @override
  Widget build(BuildContext context) {
    final showSuffixIcon = useState(false);

    final topbarStates = ref.watch(topbarStateProvider);
    final controller = useTextEditingController();

    final currentTopbarState =
        useMemoized(() => topbarStates.last, [topbarStates]);

    useEffect(() {
      controller.addListener(() {
        if (controller.text.isNotEmpty) {
          showSuffixIcon.value = true;
        } else {
          showSuffixIcon.value = false;
        }
      });
      return () {};
    }, [controller]);

    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width - 240,
        color: Theme.of(context).colorScheme.background,
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.04),
            ),
            padding:
                const EdgeInsets.only(top: 18, bottom: 18, left: 24, right: 24),
            child: Row(
              children: [
                if (currentTopbarState.showBack)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Transform.translate(
                      offset: const Offset(-2, 0),
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            context.pop();
                            ref.read(topbarStateProvider.notifier).popState();
                          }),
                    ),
                  ),
                Expanded(
                    child: Text(
                  currentTopbarState.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                )),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      cursorHeight: 15,
                      controller: controller,
                      cursorColor: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.6),
                      style: const TextStyle(fontSize: 14, height: 1.10),
                      decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: showSuffixIcon.value
                              ? IconButton(
                                  onPressed: controller.clear,
                                  icon: const Icon(Icons.clear),
                                )
                              : null,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.4)),
                          hintText: '搜索你感兴趣的媒体',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 18)),
                      onSubmitted: (value) {
                        if (value.isEmpty) return;
                        if (GoRouter.of(context)
                            .location
                            .startsWith("/browser/search/")) {
                          context.replace("/browser/search/$value");
                        } else {
                          context.push("/browser/search/$value");
                        }
                        Future(() {
                          ref.read(topbarStateProvider.notifier).go(TopBarState(
                              showBack: true,
                              title: "搜索：$value",
                              key: "/search"));
                        });
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: IconButton(
                    onPressed: () {
                      ref.read(topbarStateProvider.notifier).pushState(
                          TopBarState(showBack: true, title: '应用配置'));
                      context.push("/browser/config");
                    },
                    icon: const Icon(Icons.settings),
                    iconSize: 24,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
