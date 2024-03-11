import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'badCertificate  with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'request to ApiServer was cancel');
      case DioExceptionType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        } else {
          return ServerFailure(
              errMessage: 'Unexpected error, Please try again!');
        }
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unexpected error, Please try again!');
      default:
        return ServerFailure(
            errMessage: 'Oops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal Server error, Please try later');
    } else {
      return ServerFailure(
          errMessage: 'Oops there was an error, Please try again');
    }
  }
}
