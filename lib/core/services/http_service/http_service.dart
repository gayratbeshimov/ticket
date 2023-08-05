import 'dart:io';

// import 'package:agent/core/constants/api_const.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/core/utils/app_logger_util.dart';

class HttpService {
  HttpService.init() {
    if (_dio == null) {
      _dio = Dio();
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  static HttpService get to => Modular.get<HttpService>();

  Dio? _dio;

  Future<Response?> post({
    required String apiURL,
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
    bool isFormData = false,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.post(
          apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type":
                  isFormData ? "multipart/form-data" : "application/json"
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.post(
          apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
              "Content-Type":
                  isFormData ? "multipart/form-data" : "application/json"
            },
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> patch({
    required String apiURL,
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
    bool isFormData = false,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.patch(
          apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type":
                  isFormData ? "multipart/form-data" : "application/json"
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.patch(
          apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
              "Content-Type":
                  isFormData ? "multipart/form-data" : "application/json"
            },
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> delete({
    required String apiURL,
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.delete(
          apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.delete(
          apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> put({
    required String apiURL,
    String? path,
    String? token,
    dynamic data,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.put(
          apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );
        return response;
      } else {
        response = await _dio!.put(
          apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        return response;
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response> get({
    required String apiURL,
    String? path,
    String? url,
    Map<String, dynamic>? parameters,
    String? token,
  }) async {
    late Response response;
    AppLoggerUtil.d(
        "API: ${apiURL + (path ?? "")}\nParameters: $parameters\nToken: $token");
    try {
      if (url == null) {
        if (parameters == null) {
          if (token == null) {
            response = await _dio!.get(apiURL + path!);
            return response;
          } else {
            response = await _dio!.get(
              apiURL + path!,
              options: Options(
                headers: {"Authorization": "Bearer $token"},
              ),
            );
            return response;
          }
        }
        response = await _dio!.get(
          apiURL + path!,
          queryParameters: parameters,
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ),
        );
        return response;
      } else {
        AppLoggerUtil.d("API: $url\n Parameters: $parameters");
        if (parameters == null) {
          response = await _dio!.get(url);
          return response;
        }
        response = await _dio!.get(url, queryParameters: parameters);
        return response;
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> download({
    required String url,
  }) async {
    try {
      Response response = await _dio!.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      AppLoggerUtil.e('${e.error}');
      return e.response;
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
  }
}
