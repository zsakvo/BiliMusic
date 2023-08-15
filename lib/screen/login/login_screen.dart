import 'dart:io';
import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/api/const_api.dart';
import 'package:bilimusic/api/wbi.dart';
import 'package:bilimusic/main.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sky_engine/_http/http.dart' as sk;
// import 'package:dio_cookie_manager/dio_cookie_manager.dart' as dcm;

// import 'package:universal_io/io.dart' show Cookie;

// import 'package:cookie_jar/cookie_jar.dart' as cj;
// import 'package:path/path.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // late final WebViewController controller;
  @override
  Widget build(BuildContext context) {
    // useEffect(() {
    //   controller = WebViewController()
    //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //     ..setBackgroundColor(const Color(0x00000000))
    //     ..clearCache()
    //     ..clearLocalStorage()
    //     ..setUserAgent(
    //         "Mozilla/5.0 (iPhone; CPU iPhone OS 16_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1")
    //     ..setNavigationDelegate(
    //       NavigationDelegate(
    //         onProgress: (int progress) {
    //           // Update loading bar.
    //         },
    //         onPageStarted: (String url) {},
    //         onPageFinished: (String url) {
    //           Log.e(url, 'uri');
    //           if (url.startsWith(
    //               "https://passport.bilibili.cn/x/passport-login/web")) {
    //             Ajax().get(url.replaceAll("bilibili.cn", "bilibili.com"),
    //                 options: Options(
    //                     headers: {"Referer": "https://passport.bilibili.com/"},
    //                     followRedirects: false,
    //                     validateStatus: (status) {
    //                       return true;
    //                     }));
    //             context.go("/browser");
    //           }
    //         },
    //         onWebResourceError: (WebResourceError error) {},
    //         onNavigationRequest: (NavigationRequest request) {
    //           // if (request.url
    //           //     .startsWith('https://passport.bilibili.com/login')) {
    //           //   return NavigationDecision.prevent;
    //           // }
    //           return NavigationDecision.navigate;
    //         },
    //       ),
    //     )
    //     ..loadRequest(Uri.parse('https://passport.bilibili.com/login'));
    //   return () {};
    // }, []);

    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: const Text("登录"),
          titleSpacing: 0,
          actions: [
            TextButton.icon(
              label: const Text("刷新状态"),
              icon: const Icon(Icons.cookie_outlined),
              onPressed: () async {
                CookieManager cookieManager = CookieManager.instance();
                // final sessDataValue = (await cookieManager.getCookie(
                //         url: WebUri.uri(Uri.parse("https://bilibili.com")),
                //         name: 'SESSDATA'))
                //     ?.value;
                // if (sessDataValue != null) {
                //   // ignore: use_build_context_synchronously
                //   // context.pop();
                // }
                // context.go("/");
                // cookieManager
                //     .getCookies(
                //         url: WebUri.uri(Uri.parse("https://www.bilibili.com")))
                //     .then((value) {
                //   final cookies =
                //       value.map((e) => Cookie(e.name, e.value)).toList();

                //   Log.e();
                //   cookieJar.saveFromResponse(
                //       Uri.parse("https://www.bilibili.com"), cookies);
                // });

                Log.e(cookieJar.domainCookies, "appCookies");
                final webviewCookies = await cookieManager.getCookies(
                    url: WebUri(ApiConstants.bilibiliBase));
                Log.e(webviewCookies);
                final List<Cookie> appCookies = webviewCookies
                    .map((e) => Cookie(e.name, e.value)
                      ..domain = "bilibili.com"
                      ..expires = null)
                    .toList();
                await cookieJar.saveFromResponse(
                    Uri.parse("bilibili.com"), appCookies);
                // Log.e(cookieJar.domainCookies, "appCookies");
                Ajax()
                    .get(
                        "https://passport.bilibili.com/x/passport-login/web/login",
                        options: Options(
                            headers: {
                              "Referer": "https://passport.bilibili.com/"
                            },
                            followRedirects: false,
                            validateStatus: (status) {
                              return true;
                            }))
                    .then((value) {
                  // context.pop();
                  WbiSign.getWbiKeys(ref);
                });
              },
            )
          ],
        ),
        body: InAppWebView(
          initialSettings: InAppWebViewSettings(
              userAgent:
                  'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1'),
          initialUrlRequest: URLRequest(
              url:
                  WebUri.uri(Uri.parse('https://passport.bilibili.com/login'))),
          onLoadResource: (controller, resource) {
            final url = resource.url.toString();
            Log.e(url, 'uri');
            if (url.startsWith(
                "https://passport.bilibili.cn/x/passport-login/web")) {
              Ajax()
                  .get(url.replaceAll("bilibili.cn", "bilibili.com"),
                      options: Options(
                          headers: {
                            "Referer": "https://passport.bilibili.com/"
                          },
                          followRedirects: false,
                          validateStatus: (status) {
                            return true;
                          }))
                  .then((value) {
                context.pop();
                WbiSign.getWbiKeys(ref);
              });
            }
          },
        ));
  }
}
