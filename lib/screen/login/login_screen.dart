import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final WebViewController controller;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setUserAgent("Chrome/114.0.0.0 Safari/537.36")
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              Log.e(url, 'uri');
              if (url.startsWith(
                  "https://passport.bilibili.cn/x/passport-login/web")) {
                Ajax().get(url.replaceAll("bilibili.cn", "bilibili.com"),
                    options: Options(
                        headers: {"Referer": "https://passport.bilibili.com/"},
                        followRedirects: false,
                        validateStatus: (status) {
                          return true;
                        }));
                context.go("/browser");
              }
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              // if (request.url
              //     .startsWith('https://passport.bilibili.com/login')) {
              //   return NavigationDecision.prevent;
              // }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse('https://passport.bilibili.com/login'));
      return () {};
    }, []);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () async {
                context.go("/browser");
              },
              child: const Text("开启浏览器")),
          Flexible(child: WebViewWidget(controller: controller))
        ],
      ),
    );
  }
}
