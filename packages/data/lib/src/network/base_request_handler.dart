// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'dart:convert' as convert;
import 'dart:io';
import 'package:data/src/network/responses/base/base_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../const/consts.dart';
import '../sealed/network_result.dart';

mixin BaseRequestHandler {
  Stream<NetworkResult<T>> handleApi<T extends Object>({
    required String endPoint,
    required Future<http.Response> Function(Uri uri, {Map<String, String>? headers}) methodFunction,
    Map<String, dynamic> formData = const {},
  }) async* {
    debugPrint("handle api called");
    yield const NetworkLoading();
    try {
      var url = Uri.https(baseUrl, endPoint, formData);
      final response = await methodFunction(url, headers: {

      });

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      BaseResponse res = BaseResponse.fromJson(jsonResponse);
      if (res.status) {
        //HttpStatus.fromCode(response.statusCode).isSuccessfulHttpStatusCode
        res.data ??= res.messages;
        yield NetworkSuccess(data: res);
      } else {
        yield NetworkError(message: res.messages);
      }
    } on HttpException catch (e) {
      yield NetworkError(message: e.message);
    } on Exception catch (e) {
      yield NetworkError(message: e.toString());
    } catch (e) {
      yield const NetworkError(
          message: "Unknown issue found when requesting data"); //
    }
  }

  Future<NetworkResult<T>> handleApiFuture<T extends Object>({
    required String endPoint,
    required Future<http.Response> Function(Uri uri, {Map<String, String>? headers}) methodFunction,
    String? authorizationToken,
    Map<String, dynamic> formData = const {},
  }) async  {
    //debugPrint("handle api called");
    try {
      var url = Uri.https(baseUrl, endPoint, formData);
      final response = await methodFunction(url, headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authorizationToken'
      });
      //debugPrint("HTTP Request resp -> ${response.body}");


      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;



      BaseResponse res = BaseResponse.fromJson(jsonResponse);
      if (res.status) {
        //HttpStatus.fromCode(response.statusCode).isSuccessfulHttpStatusCode
        res.data ??= res.messages;
        return NetworkSuccess(data: res);
      } else {
        return NetworkError(message: res.messages);
      }
    } on HttpException catch (e) {
      return NetworkError(message: e.message);
    } on Exception catch (e) {
      return NetworkError(message: e.toString());
    } catch (e) {
      debugPrint("HTTP Request error -> $e");
      return const NetworkError(
          message: "Unknown issue found when requesting data"); //
    }
  }

}
