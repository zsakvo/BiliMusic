import 'dart:convert';
import 'dart:io';

import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/api/audio_api.dart';
import 'package:bilimusic/api/const_api.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:bilimusic/utils/video.dart';
import 'package:dio/dio.dart';
import 'package:memory_cache/memory_cache.dart';

class BiliServer {
  late HttpServer _server;
  String _requestKey(Uri uri) => '${uri.path}?${uri.query}';

  BiliServer();

  init() async {
    _server = await HttpServer.bind(InternetAddress.anyIPv4, 43374);
    _server.listen((request) async {
      if (request.method == 'GET') {
        switch (request.uri.path) {
          case '/v.m4a':
            String cdnUrl = await getCdnUrl(
              request,
            );

            var file = await Ajax().get(cdnUrl,
                options: Options(headers: {
                  "User-Agent": ApiConstants.userAgent,
                  "Referer": ApiConstants.bilibiliBase,
                  "range": request.headers["range"]
                }, responseType: ResponseType.bytes));

            request.response.headers.clear();
            request.response.bufferOutput = true;
            file.headers.forEach((name, value) {
              final filteredValue = value
                  .map((e) => e.replaceAll(RegExp(r'[^\x09\x20-\x7F]'), '?'))
                  .toList();
              request.response.headers.set(name, filteredValue);
            });
            request.response.headers
                .set(Headers.contentTypeHeader, "audio/mp3");
            // request.response.headers.set("connection", "close");
            request.response.statusCode = file.statusCode ?? 200;
            request.response.add(file.data);
            await request.response.flush();
            await request.response.close();
            break;
          case "/login":
            Log.d([request.headers, request.cookies]);
            break;
          default:
            request.response.statusCode = 200;
            request.response.add(utf8.encode(""));
            await request.response.flush();
            await request.response.close();
            break;
        }
      }
    });
  }

  getCdnUrl(
    request,
  ) async {
    final cachedUrl =
        MemoryCache.instance.read<String>(_requestKey(request.uri));
    if (cachedUrl != null) {
      return cachedUrl;
    }
    final aid = request.uri.queryParameters["aid"];
    final bvid = request.uri.queryParameters["bvid"];
    var cid = request.uri.queryParameters["cid"];
    final key = _requestKey(request.uri);
    if (cid == "null") {
      cid = await VideoUtil.idToCid(aid: aid, bvid: bvid);
    }
    final url = await Api.getAudioCdnUrl(aid: aid, cid: cid);
    MemoryCache.instance.create(
      key,
      url,
      expiry: const Duration(minutes: 100),
    );
    return url;
  }
}
