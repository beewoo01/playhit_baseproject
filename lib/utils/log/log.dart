import 'dart:async';

import 'package:flutter/foundation.dart';
import 'dart:developer' as dev;

class Log {

  static const _enableLog = kDebugMode;


  // 디버그 로그 출력 메서드 Log.d()
  static void d(
      Object? message, {
        String? name,
        DateTime? time,
      }) {
    log('💡 $message', name: name ?? '', time: time);
  }

  // 에러 로그 출력 메서드 Log.e()
  static void e(
      Object? errorMessage, {
        String? name,
        Object? errorObject,
        StackTrace? stackTrace,
        DateTime? time,
      }) {
    log(
      '🚫🚫🚫 $errorMessage',
      name: name ?? '',
      error: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }

  // 공통 로그 처리 메서드 Log.log(): 모든 로그 출력의 기반 메서드가 된다.
  static void log(
      String message, {
        int level = 0,
        String name = '',
        DateTime? time,
        int? sequenceNumber,
        Zone? zone,
        Object? error,
        StackTrace? stackTrace,
      }) {
    if (_enableLog) {
      dev.log(
        message,
        name: name,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}