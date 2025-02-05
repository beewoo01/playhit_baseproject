import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dio/dio.dart';


part 'network_exception.freezed.dart';

/// 네트워크 요청 중 발생하는 예외를 관리하기 위한 커스텀 Exception 클래스
// @freezed: Freezed 어노테이션을 사용해 불변 객체와 다양한 상태를 자동으로 생성
@freezed
class NetworkException implements Exception{
  // const NetworkException._(): 프라이빗 생성자. 내부 생성 용도로만 사용되며, 외부에서 직접 인스턴스화하지 못하게 함
  const NetworkException._() : super();

  // unauthorizedException: 인증되지 않은 사용자
  const factory NetworkException.unauthorizedException() =
  _UnauthorizedException;

  // otherException: 기타 예외 상태를 처리하기 위해 예외의 타입을 인자로 받는다.
  const factory NetworkException.otherException(Type type) = _OtherException;

  // formatException: 데이터 형식 오류 발생 시 사용
  const factory NetworkException.formatException() = _FormatException;

  // connectionException: 네트워크 연결 오류가 발생했을 때 사용
  const factory NetworkException.connectionException() = _ConnectionException;

  // maintenanceException: 서버 점검과 같은 예외를 처리
  const factory NetworkException.maintenanceException() = _MaintenanceException;

  const factory NetworkException.unknownException() = _UnknownException;

  // apiException: API 응답에 대한 예외 상태를 처리하며, HTTP 상태 코드와 에러 메시지를 인자로 받는다.
  const factory NetworkException.apiException(
      {int? statusCode, String? message}) = _ApiException;

  static NetworkException getException(Object error) {
    /// 예외 타입에 따른 분기 처리
    /// 이미 NetworkException 타입이면 그대로 반환
    if (error is NetworkException) {
      return error;
    } else if (error is SocketException) {
      /// 네트워크 연결 오류
      return const NetworkException.connectionException();
    } else if (error is FormatException || error is TypeError) {
      /// 데이터 형식 오류
      return const NetworkException.formatException();
    } else if (error is DioException) {
      /// Dio 라이브러리의 네트워크 예외
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const NetworkException.connectionException();

      /// 상태 코드 및 메시지 처리
        case DioExceptionType.badResponse:
          String? message;

          try {
            final json = error.response?.data as Map;

            message ??= json['Message'] as String?;
            message ??= json['message'] as String?;
          } catch (_) {}

          message ??= error.message;

          return NetworkException.apiException(
              statusCode: error.response?.statusCode, message: message);

        case DioExceptionType.badCertificate:
        case DioExceptionType.cancel:
        case DioExceptionType.unknown:

        /// 기타 예외 처리
          if (error.error is SocketException) {
            return const NetworkException.connectionException();
          } else if (error.error is FormatException ||
              error.error is TypeError) {
            return const NetworkException.formatException();
          }
      }
    }

    return NetworkException.otherException(error.runtimeType);
  }

}