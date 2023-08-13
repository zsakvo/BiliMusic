import 'package:bilimusic/screen/home/components/my_list.dart';
import 'package:bilimusic/screen/home/components/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      // extendBody: true,
      appBar: AppBar(
        elevation: 3,
        title: Icon(
          const IconData(0xe725, fontFamily: "Icon"),
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg/search.svg",
              width: 22,
            ),
          )
        ],
      ),
      body: PageView(
        children: [
          MyListComponent(),
          MyProfileComponent(),
          MyProfileComponent()
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          currentBottomIndex.value = index;
        },
        selectedIndex: currentBottomIndex.value,
        destinations: [
          NavigationDestination(
              icon: SvgPicture.asset(
                "assets/svg/tag.svg",
                width: 22,
              ),
              selectedIcon: SvgPicture.asset(
                "assets/svg/tag_filled.svg",
                width: 22,
              ),
              label: "收藏"),
          NavigationDestination(
              icon: SvgPicture.asset(
                "assets/svg/explore.svg",
                width: 22,
              ),
              selectedIcon: SvgPicture.asset(
                "assets/svg/explore_filled.svg",
                width: 22,
              ),
              label: "探索"),
          NavigationDestination(
              icon: SvgPicture.asset(
                "assets/svg/face.svg",
                width: 22,
              ),
              selectedIcon: SvgPicture.asset(
                "assets/svg/face_filled.svg",
                width: 22,
              ),
              label: "我的"),
        ],
      ),
    );
  }
}
