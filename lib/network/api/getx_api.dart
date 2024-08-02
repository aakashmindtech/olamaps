import 'package:dio/dio.dart';

import '../../common/utils/storage_service.dart';
import '../dio/dio_client.dart';

class GetxApi {
  final DioClient dioClient;
  final storageService = StorageService();

  GetxApi({required this.dioClient});

  Future<Response> loadPostFormData(endpoint, body, params, token) async {
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers["Content-Type"] = "multipart/form-data";
    dio.options.headers["token"] = token;

    try {
      final Response response = await dioClient.post(endpoint,
          data: body,
          queryParameters: params,
          options: Options(contentType: 'multipart/form-data'));

      Map<String, dynamic> data = response.data;
      //print(response.data);
      if (data['status'] == 401) {
        //   await storageService.clearData();
        //    Get.offAllNamed(Routes.loginonboardscreen);
      }
      /*  if(response.statusCode.toString()=="401")
        {
          g.Get.offNamedUntil(Routes.login, (route) => false);
          storageService.setBool(AppConstants.isLoggedIn, false);
        }*/
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadGetData(endpoint, params) async {
    try {
      final Response response =
          await dioClient.get(endpoint, queryParameters: params);
      Map<String, dynamic> data = response.data;
      // print(response.data);
      if (data['show'] == true) {
      }
      if (data?['status'] == 401) {
        //    await storageService.clearData();
        // Get.offAllNamed(Routes.loginonboardscreen);
      }
      /* if(response.statusCode.toString()=="401")
      {
        g.Get.offNamedUntil(Routes.login, (route) => false);
        storageService.setBool(AppConstants.isLoggedIn, false);
      }*/
      return response; //json.encode(response);
    } catch (e) {
      rethrow;
    }
  }

  // Future<Response> loadGetDataWithParams(endpoint, params, token) async {
  //   try {
  //     Dio dio = Dio();
  //     // dio.options.headers["X-Access-Token"] = token;
  //     final Map<String, dynamic> header = <String, dynamic>{};
  //     header["X-Access-Token"] = token;
  //
  //     final Response response =
  //         await dioClient.get(endpoint, options: Options(headers: header));
  //
  //     return response; //json.encode(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Response> loadPostDataWithParams(endpoint, params, token) async {
    try {
      final Map<String, dynamic> header = <String, dynamic>{};
      header["X-Access-Token"] = token;

      final Response response = await dioClient.post(endpoint,
          data: params, options: Options(headers: header));

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadGetDataWithOutParams(endpoint, token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["X-Request-Id"] = token;
      final Map<String, dynamic> header = <String, dynamic>{};
      header["X-Access-Token"] = token;

      final Response response =
          await dioClient.get(endpoint, options: Options(headers: header));

      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Response> loadPostData(endpoint, params) async {
    final Map<String, dynamic> header = new Map<String, dynamic>();
    //  header["token"] = token;

    try {
      final Response response = await dioClient.post(endpoint,
          queryParameters: params,
          options: Options(headers: header, contentType: 'application/json'));

      Map<String, dynamic> data = response.data;

      /*  if (data['status'] == 1) {
        await Utils.showToast(data["message"]);
      }*/

      if (data['status'] == 401) {
        //    await storageService.clearData();
        //Get.offAllNamed(Routes.loginonboardscreen);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadPostDataJsonType(endpoint, params, token) async {
    final Map<String, dynamic> header = <String, dynamic>{};
    header["x-access-token"] = token;

    try {
      final Response response = await dioClient.post(endpoint,
          data: params,
          options: Options(
            headers: header,
            contentType: 'application/json',
          ));

      Map<String, dynamic> data = response.data;

      /*  if (data['status'] == 1) {
        await Utils.showToast(data["message"]);
      }*/

      if (data['status'] == 401) {
        //    await storageService.clearData();
        //Get.offAllNamed(Routes.loginonboardscreen);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadGetDataWithParamsJsonType(
      endpoint, params, token) async {
    try {
      final Map<String, dynamic> header = <String, dynamic>{};
      header["token"] = token;
      final Response response = await dioClient.get(
        endpoint,
        queryParameters: params,
        options: Options(headers: header),
      );
      Map<String, dynamic> data = response.data;
      // print(response.data);
      if (data['show'] == true) {
      }
      if (data?['status'] == 401) {
        //    await storageService.clearData();
        // Get.offAllNamed(Routes.loginonboardscreen);
      }
      /* if(response.statusCode.toString()=="401")
      {
        g.Get.offNamedUntil(Routes.login, (route) => false);
        storageService.setBool(AppConstants.isLoggedIn, false);
      }*/
      return response; //json.encode(response);
    } catch (e) {
      rethrow;
    }
  }
}
