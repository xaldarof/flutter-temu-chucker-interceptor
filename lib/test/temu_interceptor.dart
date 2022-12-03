import 'package:dio/dio.dart';
import 'package:temu_interceptor/box/box.dart';
import 'package:temu_interceptor/models/call_cache.dart';

import '../main.dart';

class TemuInterceptor extends Interceptor {
  String date = "";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var box = await getBox<CallCacheModel>('calls');
    date = DateTime.now().toIso8601String();

    var model = CallCacheModel(
      data: options.data,
      path: options.path,
      uri: options.uri.path,
      date: date,
      queryParameters: options.queryParameters.toString(),
      method: options.method,
      baseUrl: options.baseUrl,
      connectTimeout: options.connectTimeout.toString(),
      contentType: options.contentType,
      extra: options.extra.toString(),
      followRedirects: options.followRedirects.toString(),
      listFormat: options.listFormat.name.toString(),
      receiveTimeout: options.receiveTimeout.toString(),
      responseType: options.responseType.toString(),
      headers: options.headers.toString(),
      isCompleted: handler.isCompleted.toString(),
      startDate: date,
    );

    await box.put(date, model);

    options.onReceiveProgress = (count, total) async {
      if (box.get(date) != null) {
        await box.put(date, box.get(date)!.copyWith(totalReceived: count.toString()));
      }
    };
    options.onSendProgress = (count, total) async {
      if (box.get(date) != null) {
        await box.put(date, box.get(date)!.copyWith(totalSent: count.toString()));
      }
    };

    await flutterLocalNotificationsPlugin
        .show(1, options.path, options.baseUrl, androidPlatformChannelSpecifics, payload: "Hello");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    var box = await getBox<CallCacheModel>('calls');
    var model = box.get(date);
    if (model != null) {
      var type = err.type;
      await box.put(
          date,
          model.copyWith(
              eventMessage: err.stackTrace.toString(),
              statusCode: type == DioErrorType.other ? "-1" : err.response?.statusCode.toString(),
              response: err.response?.data.toString()));
    }
    super.onError(err, handler);
  }

  void onReceive(int a, int b) {}

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    var box = await getBox<CallCacheModel>('calls');
    var model = box.get(date);
    var endDate = DateTime.now().toIso8601String();

    if (model != null) {
      await box.put(
          date,
          model.copyWith(
              endDate: endDate,
              statusCode: response.statusCode.toString(),
              response: response.data.toString()));
    }
    super.onResponse(response, handler);
  }
}
