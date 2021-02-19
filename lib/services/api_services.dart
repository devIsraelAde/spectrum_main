import 'dart:convert';
import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:spectrum_library/database/hive/database_helper.dart';
import 'package:spectrum_library/model/device.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/services/services.dart';

part 'api_services.freezed.dart';

class ApiServices {
  // final String _url = 'http://ebookapi.spectrumbookslimited.com/api/v2';

  final DatabaseHelper dbhelper;

  ApiServices({this.dbhelper});

  // Dio dio = Dio(BaseOptions(baseUrl: '${Constants.testdomainNameUrl}/api/v2')); //test

  Dio getApiClient() {
    Dio dio = Dio(BaseOptions(baseUrl: '${Constants.domainNameUrl}/api/v2')); //production
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        // Do something before request is sent
        Device device = await dbhelper?.getdeviceresponse();
        options.headers = {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'APP-KEY': '${Constants.appKey}',
          'token': device?.data?.token,
        };
        return options; //continue
        // If you want to resolve the request with some custom data，
        // you can return a `Response` object or re5turn `dio.resolve(data)`.
        // If you want to reject the request with a error message,
        // you can return a `DioError` object or return `dio.reject(errMsg)`
      },
      onResponse: (Response response) async {
        // Do something with response data
        return response; // continue
      },
      onError: (DioError e) async {
        // Do something with response error
        return e; //continue
      },
    )
        // Fresh<String>(
        //     tokenHeader: (token) {
        //       return token != null
        //           ? {
        //               'Accept': 'application/json',
        //               'Content-type': 'application/json',
        //               'APP-KEY': '${Constants.testappKey}',
        //               HttpHeaders.authorizationHeader: 'Bearer $token'
        //             }
        //           : <String, String>{};
        //     },
        //     tokenStorage: InMemoryTokenStorage(),
        //     refreshToken: (token, client) async {
        //       // final id = await sendDeviceId();
        //       final platformImei = await ImeiPlugin.getImei();
        //       final response = await dio.request('/register_device',
        //           data: {'imei': platformImei},
        //           options: Options(method: 'POST', headers: {
        //             'Accept': 'application/json',
        //             'Content-type': 'application/json',
        //             'APP-KEY': '${Constants.testappKey}',
        //           }));
        //       await dbhelper.adddevice(device: Device.fromJson(response.data));
        //       return dbhelper.getdeviceresponse().data.token;
        //     },
        //     httpClient: dio),
        );
    return dio;
  }

  Future<Map<int, String>> sendDeviceId() async {
    // final _dio =  ;
    Response response;
    try {
      final platformImei = await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
      response = await getApiClient().post('/register_device', data: FormData.fromMap({'imei': platformImei}));

      await dbhelper.adddevice(device: Device.fromJson(response.data));

      return handleError(message: response);
    } catch (e) {
      return handleError(err: e, message: response);
    }
    // return handleError(err: response.data);
  }

  Future<ApiResourcesMethod> getResources(String resource, [String bookid, String level]) async {
    Response response;
    try {
      response = await getApiClient().post('/resources',
          data: FormData.fromMap({
            'resource': resource,
            'book_id': bookid ?? '',
            'level': level ?? '',
          }));
      Map<String, dynamic> responsedata = response.data['data'];

      if (responsedata.containsKey('examples')) {
        //todo store to db
        return ApiResourcesMethod.puzzles(puzzleData: PuzzleData.fromJson(responsedata));
      } else if (responsedata.containsKey('books')) {
        //todo store to db
        return ApiResourcesMethod.books(books: Books.fromJson(responsedata));
      } else if (responsedata.containsKey('games')) {
        //todo store to db
        return ApiResourcesMethod.games(games: Game.fromJson(responsedata));
      } else if (responsedata.containsKey(('special_books'))) {
        //todo store to db
        return ApiResourcesMethod.specialbooks(specialBooks: SpecialBooks.fromJson(responsedata));
      }
    } catch (e) {
      return ApiResourcesMethod.none(message: handleError(err: e, message: response).values.elementAt(0));
      // return handleError(err: e, message: response);
    }
  }

  Future<Map<int, String>> createAccount(
      {String firstname, String lastname, String phone, String accesscode, BuildContext context, String email}) async {
    // final _dio = await getApiClient();

    // int result;
    Response response;
    try {
      final deviceresponse = await dbhelper.getdeviceresponse();
      response = await getApiClient().post('/register_user',
          data: FormData.fromMap({
            'user_id': deviceresponse.data.userId,
            'first_name': firstname,
            'email': email ?? '',
            'last_name': lastname,
            'phone': phone,
            'access_code': accesscode,
          }));
      if (response.statusCode == 200) {
        await dbhelper.adduser(
            user: User(first_name: firstname, last_name: lastname, phone: phone, access_code: accesscode));
        await dbhelper.addbooks(books: response.data);
        await dbhelper.addbooksandgames(books: response.data);
        await AndroidAlarmManager.initialize();
        // return response.data;
        return handleError(message: response);
      } else {
        return handleError(message: response);
        // ToastMessage.toast("User's Registration Failed");
      }
    } catch (e) {
      return handleError(err: e, message: response);
      // throw 'Network Issue';
    }
  }

  Map<int, String> handleError({dynamic err, Response message}) {
    if (err is DioError) {
      switch (err.type) {
        case DioErrorType.RESPONSE:
          return {
            0: '${message != null ? Books.fromJson(message.data).message : Error} \n ${err.response.data['message']}'
          };
          break;
        case DioErrorType.SEND_TIMEOUT:
          return {0: 'Send timeout in connection with API server'};
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          return {0: 'Connection timeout with API server'};
          break;
        case DioErrorType.DEFAULT:
          return {0: 'Connection to API server failed due to internet connection'};
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          return {0: 'Receive timeout in connection with API server'};
          break;
        default:
          return {0: 'Eror Occurred \n ${Books.fromJson(message.data).message ?? ''}'};
      }
    } else {
      return {1: '${Books.fromJson(message.data).message ?? ''}'};
    }
  }

  // Future<> getkidsgames(){
  // //   final Map choices = {
  // //   '🍏': Colors.green,
  // //   '🍋': Colors.yellow,
  // //   '🍅': Colors.red,
  // //   '🍇': Colors.purple,
  // //   '🥥': Colors.brown,
  // //   '🥕': Colors.orange
  // // };

  // // todo: store data to db.
  // }

}

@freezed
abstract class ApiResourcesMethod with _$ApiResourcesMethod {
  const factory ApiResourcesMethod.games({Game games}) = GameResource;
  const factory ApiResourcesMethod.books({Books books}) = BookResource;
  const factory ApiResourcesMethod.specialbooks({SpecialBooks specialBooks}) = SpecialBookResource;
  const factory ApiResourcesMethod.puzzles({PuzzleData puzzleData}) = PuzzleResource;
  const factory ApiResourcesMethod.none({String message}) = NoneResource;
}
