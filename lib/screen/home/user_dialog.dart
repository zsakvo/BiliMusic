import 'package:bilimusic/api/user_api.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDialog extends StatefulHookConsumerWidget {
  const UserDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserDialogState();
}

class _UserDialogState extends ConsumerState<UserDialog> {
  @override
  Widget build(BuildContext context) {
    final navInfo = ref.watch(navInfoProvider);
    final navStat = useFuture(useMemoized(() => UserApi.navStat()),
        initialData: {"following": 0, "follower": 0, "dynamic_count": 0});
    final levelValue = useMemoized(() {
      if (navInfo == null) return 0.0;
      if (navInfo.data.levelInfo!.nextExp == "--") return 1.0;
      return navInfo.data.levelInfo!.currentExp /
              navInfo.data.levelInfo!.nextExp is String
          ? double.parse(navInfo.data.levelInfo!.nextExp)
          : navInfo.data.levelInfo!.nextExp * 1.0;
    }, []);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: navInfo!.data.face!,
                  width: 56,
                  height: 56,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        navInfo.data.uname!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Mid:${navInfo.data.mid}\t\t\t",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.7)),
                        ),
                        SvgPicture.asset(
                          "assets/svg/lv${navInfo.data.levelInfo!.currentLevel}.svg",
                          width: 12,
                          height: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(children: [
                    const Icon(
                      IconData(0xe734, fontFamily: "Icon"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(navInfo.data.money.toString()),
                    ),
                  ]),
                  Container(
                    height: 18,
                    padding: const EdgeInsets.only(left: 12, right: 16),
                    child: VerticalDivider(
                      thickness: 1.7,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                    ),
                  ),
                  Row(children: [
                    const Icon(
                      IconData(0xe736, fontFamily: "Icon"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(navInfo.data.wallet!.bcoinBalance
                          .toString()
                          .toString()),
                    ),
                  ])
                ],
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 0),
            child: Transform.translate(
              offset: const Offset(0, 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "经验值：${navInfo.data.levelInfo!.currentExp}\t\t/\t\t${navInfo.data.levelInfo!.nextExp}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6)),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Row(
              children: [
                Flexible(
                    child: LinearProgressIndicator(
                  minHeight: 1.4,
                  value: levelValue,
                  color: Theme.of(context).colorScheme.primary,
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Row(
                    children: [
                      numLabel(context,
                          label: "关注",
                          num: StringFormatUtils.formatNumberWithUnit(
                              navStat.data['following'])),
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
                      numLabel(context,
                          label: "粉丝",
                          num: StringFormatUtils.formatNumberWithUnit(
                              navStat.data['follower'])),
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
                      numLabel(context,
                          label: "动态",
                          num: StringFormatUtils.formatNumberWithUnit(
                              navStat.data['dynamic_count'])),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  numLabel(context, {required String label, dynamic num}) {
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
