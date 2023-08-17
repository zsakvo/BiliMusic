import 'package:bilimusic/components/player/player_mobile.dart';
import 'package:bilimusic/screen/home/components/my_list.dart';
import 'package:bilimusic/screen/home/components/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_screen_desktop.dart';

class HomeMobileScreen extends StatefulHookConsumerWidget {
  const HomeMobileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeMobileScreenState();
}

class _HomeMobileScreenState extends ConsumerState<HomeMobileScreen> {
  // final tabSelectedStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  // final tabNormalStyle = TextStyle(fontSize: 18);
  // final tabs = ["我的", "发现"];
  @override
  Widget build(BuildContext context) {
    final currentBottomIndex = useState(0);
    return Scaffold(
      key: ref.watch(homeScaffoldKey),
      // extendBody: true,
      appBar: AppBar(
        elevation: 3,
        centerTitle: false,
        title: Icon(
          const IconData(0xe725, fontFamily: "Icon"),
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push("/search");
            },
            icon: SvgPicture.asset(
              "assets/svg/search.svg",
              width: 22,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            children: const [
              MyListComponent(),
              MyProfileComponent(),
              MyProfileComponent()
            ],
          ),
          const Positioned(
            left: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.zero,
              child: PlayerMobileComponent(),
            ),
          )
        ],
      ),
      // bottomNavigationBar: NavigationBar(
      //   height: 64,
      //   onDestinationSelected: (int index) {
      //     currentBottomIndex.value = index;
      //   },
      //   selectedIndex: currentBottomIndex.value,
      //   destinations: [
      //     NavigationDestination(
      //         icon: SvgPicture.asset(
      //           "assets/svg/tag.svg",
      //           width: 21,
      //         ),
      //         selectedIcon: SvgPicture.asset(
      //           "assets/svg/tag_filled.svg",
      //           width: 21,
      //         ),
      //         label: "收藏"),
      //     NavigationDestination(
      //         icon: SvgPicture.asset(
      //           "assets/svg/explore.svg",
      //           width: 21,
      //         ),
      //         selectedIcon: SvgPicture.asset(
      //           "assets/svg/explore_filled.svg",
      //           width: 21,
      //         ),
      //         label: "探索"),
      //     NavigationDestination(
      //         icon: SvgPicture.asset(
      //           "assets/svg/face.svg",
      //           width: 21,
      //         ),
      //         selectedIcon: SvgPicture.asset(
      //           "assets/svg/face_filled.svg",
      //           width: 21,
      //         ),
      //         label: "我的"),
      //   ],
      // ),
    );
  }
}
