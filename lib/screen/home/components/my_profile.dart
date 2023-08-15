import 'package:bilimusic/utils/log.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfileComponent extends StatefulHookConsumerWidget {
  const MyProfileComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyProfileComponentState();
}

class _MyProfileComponentState extends ConsumerState<MyProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
                width: 360,
                imageUrl:
                    'https://s1.hdslb.com/bfs/static/laputa-search/client/assets/nodata.67f7a1c9.png'),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 96),
              child: Text(
                '今天真是寂寞如雪啊~',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.4)),
              ),
            ),
            FilledButton(
                onPressed: () {
                  Log.e("点击登录按钮");
                  context.push("/login");
                },
                child: const Text('登录')),
          ],
        ),
      ),
    );
  }
}
