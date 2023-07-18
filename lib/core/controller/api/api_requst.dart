import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

const String baseUrl = 'http://192.168.0.100:4000';

class ApiRequest {
  Future<void> _handleError(dynamic error) async {
    if (error is DioError) {
      final errorMessage = error.response?.data?['message'] ??
          'Something Went Wrong. Please try Again';
      switch (error.type) {
        case DioErrorType.receiveTimeout:
          await EasyLoading.showError(
            'Unable to connect to the server. Please try again.',
          );
          break;
        case DioErrorType.cancel:
          await EasyLoading.showError(
            'The request has been canceled. Please try again.',
          );
          break;
        default:
          await EasyLoading.showError(errorMessage as String);
      }
    }
  }

  Future<Response<T>?> postHttp<T>(
    String baseUrl,
    Map<String, dynamic> body,
    String endpoint,
    String? token,
  ) async {
    final Dio dio = Dio();
    await EasyLoading.show(status: 'Loading', dismissOnTap: true);
    Response<T>? response;

    try {
      if (baseUrl.isNotEmpty) {
        response = await dio.post(
          baseUrl + endpoint,
          data: body,
          options: Options(
            headers: <String, dynamic>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        );
      }

      return response;
    } on DioError catch (e) {
      await _handleError(e);
    } catch (e) {
      await EasyLoading.showError(e.toString());
    }

    return null;
  }

  Future<Response<T>?> getHttp<T>(
    String baseUrl,
    String endpoint,
    String token,
    String s, {
    Map<String, dynamic>? queryParam,
  }) async {
    Response<T>? response;
    final Dio dio = Dio();

    try {
      if (baseUrl.isNotEmpty) {
        response = await dio.get(
          baseUrl + endpoint,
          queryParameters: queryParam,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.statusCode == 200) {
          return response;
        }
      }

      return response;
    } on DioError catch (e) {
      await _handleError(e);
    } catch (e) {
      await _handleError(e);
    }

    return null;
  }

  Future<Response<T>?> putHttp<T>(
    String baseUrl,
    String endpoint,
    String? token, {
    Map<String, dynamic>? body,
  }) async {
    Response<T>? response;
    final Dio dio = Dio();

    try {
      if (baseUrl.isNotEmpty) {
        response = await dio.put(
          baseUrl + endpoint,
          data: body,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.data != null) {
          return response;
        }
      }
    } on DioError catch (e) {
      await _handleError(e);
    } catch (e) {
      await _handleError(e);
    }

    return response;
  }
}
