import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ticket_reselling/export.dart';

class NetworkService {
  bool isApiCalling = false;

  NetworkService._();

  factory NetworkService() => _instance;
  static final NetworkService _instance = NetworkService._();

  static String? accessToken;
  static String? refreshToken;

  final Dio dio = Dio();

  Future<void> init() async {
    Logger.printer(title: "Init Call In Network Services $accessToken");
    final options = BaseOptions(
      baseUrl: ApiEndPoints.kBaseUrl,
      // connectTimeout: const Duration(seconds: 30),
      // receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json', if (accessToken != null) 'Authorization': 'Bearer $accessToken'},
      responseType: ResponseType.json,
      followRedirects: false,
      receiveDataWhenStatusError: true,
    );
    dio.options = options;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        // onError: onErrorDio,
        // onError: (DioException e, handler) {
        //   // Ensure that errors are handled correctly and passed through
        //   Logger.logPrint(title: '⚠️ DioException Interceptor', body: e.toString());
        //   onErrorDio(e, handler); // Call your error handler
        //   return handler.next(e); // Pass the error to the next handler
        // },
      ),
    );
  }

  Future<ApiResponse<T>> get<T extends Serializable>(
    String url, {
    T Function(Map<String, dynamic>)? fromJsonT,
  }) async {
    try {
      logRequest('GET', url, null);
      final response = await dio.get(url);
      logResponse('GET', url, response);
      return _returnResponse<T>(response, fromJsonT);
    } catch (e) {
      return _handleError<T>(e, url, fromJsonT);
    }
  }

  Future<ApiResponse<T>> post<T extends Serializable>(
    String url, {
    FormData? body,
    T Function(Map<String, dynamic>)? fromJsonT,
    bool isHeaderRequired = true,
  }) async {
    try {
      if (body != null) {
        final formDataFields = body.fields.map((field) => "${field.key}: ${field.value}").join('\n');
        logRequest('POST', url, formDataFields);
      }
      final response = await dio.post(url, data: body);
      logResponse('POST', url, response);
      return _returnResponse<T>(response, fromJsonT);
    } catch (e) {
      return _handleError<T>(e, url, fromJsonT);
    }
  }

  Future<ApiResponse<T>> delete<T extends Serializable>(
    String url, {
    T Function(Map<String, dynamic>)? fromJsonT,
  }) async {
    try {
      logRequest('DELETE', url, null);
      final response = await dio.delete(url);
      logResponse('DELETE', url, response);
      return _returnResponse<T>(response, fromJsonT);
    } catch (e) {
      return _handleError<T>(e, url, fromJsonT);
    }
  }

  ApiResponse<T> _returnResponse<T extends Serializable>(
      Response response, T Function(Map<String, dynamic>)? fromJsonT) {
    // Logger.logPrint(title: "⏯️ : ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(jsonEncode(response.data));
        return ApiResponse.fromJson(responseJson, fromJsonT!);
      case 201:
        debugPrint("Created Successfully #######################");
        final responseJson = json.decode(jsonEncode(response.data));
        if (fromJsonT == null) {
          Logger.logPrint(title: "✅ JsonPayload", body: responseJson.toString());
          return ApiResponse(success: true, message: responseJson['message'], error: responseJson['error']);
        }
        Logger.logPrint(title: "✅ ResponseJson", body: responseJson.toString());
        return ApiResponse.fromJson(responseJson, fromJsonT);
      case 400:
        final responseJson = json.decode(jsonEncode(response.data));
        return ApiResponse.fromJson(responseJson, fromJsonT!);
      case 401:
        final responseJson = json.decode(jsonEncode(response.data));
        userUnAuthorized(responseJson);
        return ApiResponse(success: false);
      default:
        return ApiResponse(
          success: false,
          message: null,
          error: ErrorResponseModel(
            code: response.statusCode,
            message: '${response.statusCode}: ${response.statusMessage}',
          ),
        );
    }
  }

  ApiResponse<T> _handleError<T extends Serializable>(
      dynamic error, String url, T Function(Map<String, dynamic>)? fromJsonT) {
    Logger.logPrint(title: "🔥 _handleError", body: error.toString());

    if (error is SocketException) {
      Logger.logPrint(title: '📛 SocketException', body: 'No internet connection');
      return ApiResponse(
        success: false,
        message: 'No internet connection',
        error: ErrorResponseModel(code: 404, message: 'SocketException: No internet connection'),
      );
    } else if (error is DioException) {
      Logger.logPrint(
          title: '⚠️ DioException: :  ${error.type.runtimeType} : ${error.error.runtimeType}', body: '${error.error}');
      if (error.error is SocketException) {
        if (error.error.toString().contains('No address associated with hostname')) {
          return ApiResponse(
            success: false,
            message: null,
            error: ErrorResponseModel(code: 9999, message: 'No internet connection'),
          );
        } else if (error.error.toString().contains('No route to host')) {
          return ApiResponse(
            success: false,
            message: null,
            error: ErrorResponseModel(code: 404, message: 'SocketException: Server unreachable'),
          );
        } else {
          return ApiResponse(
            success: false,
            message: null,
            error: ErrorResponseModel(code: 404, message: 'SocketException: Server unreachable'),
          );
        }
      } else if (error.error is HttpException) {
        return ApiResponse(
          success: false,
          message: null,
          error: ErrorResponseModel(code: 405, message: 'Server unreachable'),
        );
      } else if (error.response != null) {
        Logger.logPrint(title: 'DioException: : ${error.response!.statusCode}', body: '${error.response!.data}');
        // logResponse('POST', url, error.response!);
        return _returnResponse<T>(error.response!, fromJsonT);
      } else {
        return ApiResponse(
          success: false,
          message: null,
          error: ErrorResponseModel(code: 3001, message: 'DioException:${error.error}'),
        );
      }
    } else {
      debugPrint('🟥🟥🟥 handleError:: $error');
      return ApiResponse(
        success: false,
        message: null,
        error: ErrorResponseModel(code: 3001, message: 'Other error ${error.error}'),
      );
    }
  }

  void logRequest(String method, String url, String? queryParameters) {
    log(
      "\n>>>>>>>>>>>>>>>>[REQUEST]>>>>>>>>>>>>>>>>\n"
      "METHOD  ==> $method : $url \n"
      "Header  ==> ${dio.options.headers}\n"
      "Query    ==> ${queryParameters ?? 'No queryParameters'}\n"
      ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>",
    );
  }

  void logResponse(String method, String url, Response response) {
    log(
      "\n<<<<<<<<<<<<<<<[RESPONSE]<<<<<<<<<<<<<<<<\n"
      "METHOD     ==> $method : $url\n"
      "STATUS     ==> ${response.statusCode}\n"
      "BODY       ==> ${jsonEncode(response.data)}\n"
      "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",
    );
  }

  void userUnAuthorized(responseJson) {
    debugPrint("userUnAuthorized--------->> ${responseJson.toString()}");
  }

  // ApiResponse<T> handleCustomCase<T extends Serializable>(responseJson) {
  //   Logger.logPrint(title: "InSide CustomCodeHandler", body: responseJson['message']);
  //   // var context = navigatorKey.currentState!.context;
  //   // while (GoRouter.of(context).canPop()) pop(context);
  //   // replacePage(context, AppRoutes.loginScreen);
  //   // SharedPreferencesService.instance!.isLoggedIn = false;
  //   // return ApiResponse(
  //   //   success: false,
  //   //   data: null,
  //   //   code: responseJson['code'],
  //   //   message: responseJson['message'],
  //   //   error: ErrorResponseModel(code: responseJson['code'], message: responseJson['message']),
  //   // );
  // }
}
