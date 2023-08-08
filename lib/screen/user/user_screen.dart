import 'package:bilimusic/components/player/provider.dart';
import 'package:bilimusic/components/tab_bar/filled_tab_bar.dart';
import 'package:bilimusic/models/user/user_video.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/utils/player.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'provider.dart';

class UserScreen extends StatefulHookConsumerWidget {
  const UserScreen(this.mid, {super.key});

  final dynamic mid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final player = ref.watch(playerProvider);
    final tabController = useTabController(initialLength: 1, vsync: this);
    final userCard = ref.watch(userCardProvider(widget.mid));
    final userVideos = ref.watch(userVideosProvider(widget.mid));
    return userVideos.when(data: (data) {
      // 从 videos 生成 playRes 列表
      final playResList = data
          .map((element) => PlayRes(
              intro: element.meta?.intro ?? element.description,
              cover: element.pic,
              title: element.title,
              artist: element.author,
              aid: element.aid,
              type: ResType.video))
          .toList();
      final cardData = userCard.asData!.value;
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 32, left: 32, right: 32, bottom: 24),
              child: Row(
                children: [
                  // 圆形的用户头像
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: CircleAvatar(
                      radius: 42,
                      backgroundImage: NetworkImage(cardData.card.face),
                    ),
                  ),
                  // 上面是用户名，下面是用户签名
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            cardData.card.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          // 显示 level 徽章
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: SvgPicture.asset(
                              "assets/svg/lv${cardData.card.levelInfo.currentLevel}.svg",
                              width: 12,
                              height: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        cardData.card.sign,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // 展示关注数，粉丝数，获赞数，用短数线分割
                  Row(
                    children: [
                      numLabel(
                          label: "关注",
                          num: StringFormatUtils.formatNumberWithUnit(
                              cardData.card.attention)),
                      SizedBox(
                        height: 23,
                        width: 40,
                        child: VerticalDivider(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.1),
                        ),
                      ),
                      numLabel(
                          label: "粉丝",
                          num: StringFormatUtils.formatNumberWithUnit(
                              cardData.card.fans)),
                      SizedBox(
                        height: 23,
                        width: 40,
                        child: VerticalDivider(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.1),
                        ),
                      ),
                      numLabel(
                          label: "获赞",
                          num: StringFormatUtils.formatNumberWithUnit(
                              cardData.likeNum)),
                    ],
                  ),
                  // 如果已经关注，button 置灰显示取消关注，否则高亮显示关注
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 48),
                  //   child: !cardData.following
                  //       ? FilledButton(
                  //           onPressed: () {},
                  //           style: OutlinedButton.styleFrom(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 16, horizontal: 24),
                  //           ),
                  //           child: const Text("关注"),
                  //         )
                  //       : OutlinedButton(
                  //           onPressed: () {},
                  //           style: OutlinedButton.styleFrom(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 16, horizontal: 24),
                  //             foregroundColor: Theme.of(context)
                  //                 .colorScheme
                  //                 .error, // 使用主题中定义的错误颜色
                  //             side: BorderSide(
                  //                 color: Theme.of(context)
                  //                     .colorScheme
                  //                     .error), // 设置边框颜色为错误颜色
                  //           ),
                  //           child: const Text("取消关注"),
                  //         ),
                  // )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 12),
            sliver: SliverToBoxAdapter(
              child: FilledTabBar(
                tabController: tabController,
                tabs: const [
                  "投稿", /*"合集", "收藏"*/
                ],
                indent: 20,
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              final Vlist video = data[index];
              return Container(
                color: index % 2 == 0
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.2),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 42),
                child: InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: video.pic,
                          width: 42,
                          height: 42,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(left: 12, right: 28),
                          child: Text(
                            video.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.8)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            video.author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.4)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            video.meta?.intro ?? video.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.4)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.only(left: 24, right: 28),
                          child: Text(
                            video.length,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.4)),
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    PlayerUtils.playList(player, ref, playResList,
                        initialIndex: index);
                  },
                ),
              );
            },
            itemCount: data.length,
          ),
        ],
      );
    }, error: (error, stackTrace) {
      // return Text(error.toString());
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
              width: 360,
              imageUrl:
                  'https://s1.hdslb.com/bfs/static/laputa-search/client/assets/nodata.67f7a1c9.png'),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 36),
            child: Text(
              '今天真是寂寞如雪啊~',
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.4)),
            ),
          )
        ],
      );
    }, loading: () {
      // 返回屏幕居中的 loading
      return const Center(child: CircularProgressIndicator());
    });
  }

  // 封装的数值展示组件
  numLabel({required String label, dynamic num}) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: num.toString(),
              style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.onBackground)),
          const TextSpan(
              text: "\n\n", style: TextStyle(height: 3, fontSize: 1)),
          TextSpan(
              text: label,
              style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5)))
        ]));
  }
}
