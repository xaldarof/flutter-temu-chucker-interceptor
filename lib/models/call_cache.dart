import 'package:hive_flutter/adapters.dart';

part 'call_cache.g.dart';

@HiveType(typeId: 1)
class CallCacheModel extends HiveObject {
  @HiveField(0)
  String? data;
  @HiveField(1)
  String? path;
  @HiveField(2)
  String? uri;
  @HiveField(3)
  String? queryParameters;
  @HiveField(4)
  String? method;
  @HiveField(5)
  String? baseUrl;
  @HiveField(6)
  String? connectTimeout;
  @HiveField(7)
  String? contentType;
  @HiveField(8)
  String? extra;
  @HiveField(9)
  String? followRedirects;
  @HiveField(10)
  String? listFormat;
  @HiveField(11)
  String? receiveTimeout;
  @HiveField(12)
  String? responseType;
  @HiveField(13)
  String? headers;
  @HiveField(14)
  String? validateStatus;
  @HiveField(15)
  String? isCompleted;
  @HiveField(16)
  String? date;
  @HiveField(17)
  String? response;
  @HiveField(18)
  String? statusCode;
  @HiveField(19)
  String? eventMessage;
  @HiveField(20)
  String? startDate;
  @HiveField(21)
  String? endDate;
  @HiveField(22)
  String? totalSent;
  @HiveField(23)
  String? totalReceived;

  @override
  String toString() {
    return 'CallCacheModel{data: $data, path: $path, uri: $uri, queryParameters: $queryParameters, method: $method, baseUrl: $baseUrl, connectTimeout: $connectTimeout, contentType: $contentType, extra: $extra, followRedirects: $followRedirects, listFormat: $listFormat, receiveTimeout: $receiveTimeout, responseType: $responseType, headers: $headers, validateStatus: $validateStatus, isCompleted: $isCompleted, date: $date, response: $response, statusCode: $statusCode, eventMessage: $eventMessage, startDate: $startDate, endDate: $endDate, totalSent: $totalSent, totalReceived: $totalReceived}';
  }

  CallCacheModel(
      {this.data,
      this.path,
      this.uri,
      this.queryParameters,
      this.method,
      this.baseUrl,
      this.connectTimeout,
      this.contentType,
      this.extra,
      this.followRedirects,
      this.listFormat,
      this.receiveTimeout,
      this.responseType,
      this.headers,
      this.validateStatus,
      this.isCompleted,
      this.date,
      this.response,
      this.statusCode,
      this.eventMessage,
      this.startDate,
      this.endDate,
      this.totalSent,
      this.totalReceived});

  CallCacheModel copyWith({
    String? data,
    String? path,
    String? uri,
    String? queryParameters,
    String? method,
    String? baseUrl,
    String? connectTimeout,
    String? contentType,
    String? extra,
    String? followRedirects,
    String? listFormat,
    String? receiveTimeout,
    String? responseType,
    String? headers,
    String? validateStatus,
    String? isCompleted,
    String? date,
    String? response,
    String? statusCode,
    String? eventMessage,
    String? startDate,
    String? endDate,
    String? totalSent,
    String? totalReceived,
  }) {
    return CallCacheModel(
      data: data ?? this.data,
      path: path ?? this.path,
      uri: uri ?? this.uri,
      queryParameters: queryParameters ?? this.queryParameters,
      method: method ?? this.method,
      baseUrl: baseUrl ?? this.baseUrl,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      contentType: contentType ?? this.contentType,
      extra: extra ?? this.extra,
      followRedirects: followRedirects ?? this.followRedirects,
      listFormat: listFormat ?? this.listFormat,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      responseType: responseType ?? this.responseType,
      headers: headers ?? this.headers,
      validateStatus: validateStatus ?? this.validateStatus,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      response: response ?? this.response,
      statusCode: statusCode ?? this.statusCode,
      eventMessage: eventMessage ?? this.eventMessage,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalSent: totalSent ?? this.totalSent,
      totalReceived: totalReceived ?? this.totalReceived,
    );
  }
}
