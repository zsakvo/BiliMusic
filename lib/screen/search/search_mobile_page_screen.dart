import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchMobilePageScreen extends StatefulHookConsumerWidget {
  const SearchMobilePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchMobilePageScreen();
}

class _SearchMobilePageScreen extends ConsumerState<SearchMobilePageScreen> {
  @override
  Widget build(BuildContext context) {
    final showSuffixIcon = useState(false);
    final controller = useTextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        // elevation: 3,
        titleSpacing: 0,
        title: Container(
          height: 38,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.7),
              borderRadius: BorderRadius.circular(20)),
          child: TextField(
            cursorHeight: 15,
            controller: controller,
            cursorColor:
                Theme.of(context).colorScheme.tertiary.withOpacity(0.6),
            style: const TextStyle(fontSize: 14, height: 1.10),
            decoration: InputDecoration(
                suffixIcon: showSuffixIcon.value
                    ? IconButton(
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear,
                          size: 18,
                        ),
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
                contentPadding:
                    const EdgeInsets.only(left: 18, right: 18, top: 22)),
            autofocus: true,
            onSubmitted: (value) {
              if (value.isEmpty) return;
              GoRouter.of(context).push("/search_result/$value");
              // if (GoRouter.of(context)
              //     .location
              //     .startsWith("/browser/search/")) {
              //   context.replace("/browser/search/$value");
              // } else {
              // context.push("/browser/search/$value");
              // }
              // Future(() {
              //   ref.read(topbarStateProvider.notifier).go(TopBarState(
              //       showBack: true,
              //       title: "搜索：$value",
              //       key: "/search"));
              // });
            },
          ),
        ),
      ),
    );
  }
}
