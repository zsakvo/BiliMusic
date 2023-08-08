import 'package:bilimusic/api/wbi.dart';
import 'package:bilimusic/main.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'const_api.dart';

class Ajax {
  static final Ajax _instance = Ajax._internal();
  factory Ajax() => _instance;
  static late final Dio dio;
  static late final CookieManager cookieManager;
  CancelToken _cancelToken = CancelToken();

  late ProviderContainer providerContainer;

  ///初始化构造
  Ajax._internal() {
    BaseOptions options = BaseOptions(
      headers: {
        'keep-alive': true,
        'user-agent': ApiConstants.userAgent,
        'Accept-Encoding': 'gzip'
      },
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      contentType: Headers.jsonContentType,
      persistentConnection: true,
    );
    dio = Dio(options);
    dio.transformer = BackgroundTransformer();
    // 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());
  }

  ///初始化设置
  Future<void> init(ProviderContainer providerContainer) async {
    this.providerContainer = providerContainer;
    if (kIsWeb) {
      cookieManager = CookieManager(CookieJar());
    } else {
      cookieManager = CookieManager(cookieJar);
    }
    dio.interceptors.add(cookieManager);
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        return handler.next(e);
      },
    ));
    if ((await cookieManager.cookieJar
            .loadForRequest(Uri.parse(ApiConstants.bilibiliBase)))
        .isEmpty) {
      try {
        await dio.get(ApiConstants.bilibiliBase); //获取默认cookie
      } catch (e) {
        // Log.e("utils/my_dio, ${e.toString()}");
      }
    }
    WbiSign.getWbiKeys(providerContainer);
  }

  // 关闭dio
  void cancelRequests({required CancelToken token}) {
    _cancelToken.cancel("cancelled");
    _cancelToken = token;
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      needSign = false}) async {
    if (needSign) {
      queryParameters =
          await WbiSign.encodeParams(queryParameters ?? {}, providerContainer);
    }
    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }

  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }
}

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  // 是否有网
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      // case DioErrorType.badCertificate:
      //   Get.rawSnackbar(message: 'bad certificate');
      //   break;
      // case DioErrorType.badResponse:
      //   Get.rawSnackbar(message: 'bad response');
      //   break;
      // case DioErrorType.cancel:
      //   Get.rawSnackbar(message: 'canceled');
      //   break;
      // case DioErrorType.connectionError:
      //   Get.rawSnackbar(message: 'connection error');
      //   break;
      case DioExceptionType.connectionTimeout:
        Log.e('connection timeout');
        break;
      // case DioErrorType.receiveTimeout:
      //   Get.rawSnackbar(message: 'receive timeout');
      //   break;
      // case DioErrorType.sendTimeout:
      //   Get.rawSnackbar(message: 'send timeout');
      //   break;
      case DioExceptionType.unknown:
        if (!await isConnected()) {
          //网络未连接
          // Get.rawSnackbar(title: '网络未连接 ', message: '请检查网络状态');
          handler.reject(err);
        }
        // else {
        //   Get.rawSnackbar(message: '未知网络错误');
        // }
        break;
      default:
    }

    return super.onError(err, handler);
  }
}
