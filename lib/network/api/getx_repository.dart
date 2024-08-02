import 'package:coachmarker/network/model/ola_autocomplete_model.dart';
import 'package:dio/dio.dart';

import '../../common/utils/storage_service.dart';
import '../constant/endpoints.dart';
import '../dio/dio_exception.dart';
import '../model/distance_model.dart';
import '../model/vehicle_booking/get_vehicle_model.dart';
import '../model/vehicle_booking/vehicle_brand_model.dart';
import 'getx_api.dart';

class GetxRepository {
  final GetxApi getxApi;
  final storageService = StorageService();

  GetxRepository(this.getxApi);

  // Future vehicleBrandsApi(token) async {
  //   try {
  //     final response = await getxApi.loadGetDataWithOutParams(
  //         Endpoints.get_vehicle_brand, token);
  //
  //     // return ConferenceRoomsModel.fromJson(response.data);
  //
  //     final vehicleTypes = response.data
  //         .map((data) => VehicleBrandModel.fromJson(data))
  //         .toList();
  //
  //     return vehicleTypes;
  //   } on DioError catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
  //
  // Future getVehicleApi(requestJson, token) async {
  //   try {
  //     final response = await getxApi.loadPostDataWithParams(
  //         Endpoints.get_vehicle_fleet, requestJson, token);
  //
  //     return GetVehicleModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  Future getOlaAutoComplete(value) async {
    try {
      final response = await getxApi.loadGetDataWithOutParams(
          "autocomplete?input=$value&api_key=wLoeUAKoa3j0fVME728vJptH6aTlgHoEn34xh7kH", 'wLoeUAKoa3j0fVME728vJptH6aTlgHoEn34xh7kH');

      print(response);

      return OlaAutoCompleteModel.fromJson(response.data);
      // return OlaAutoCompleteModel(
      //     errorMessage: response.data["error_message"],
      //     infoMessages: response.data["info_messages"],
      //     predictions: response.data["predictions"],
      //     status: response.data["status"]).fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future getDistanceItems(sourceLat, sourceLong, destLat, destLong) async {
    try {
      final response = await getxApi.loadGetDataWithOutParams(
          "directions?origin=$sourceLat,$sourceLong&destination=$sourceLat,$sourceLong&api_key=wLoeUAKoa3j0fVME728vJptH6aTlgHoEn34xh7kH", 'wLoeUAKoa3j0fVME728vJptH6aTlgHoEn34xh7kH');

      print(response);

      return DistanceModel.fromJson(response.data);


    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future getOlaDirections(lat, long) async {
    try {
      final response = await getxApi.loadGetDataWithOutParams(
          "directions?origin=18.76029027465273,73.3814242364375&destination=18.73354223011708,73.44587966939002&waypoints=18.75171540179755%2C%2073.4067693460594&api_key=wLoeUAKoa3j0fVME728vJptH6aTlgHoEn34xh7kH", 'wLoeUAKoa3j0fVME728vJptH6aTlgHoEn34xh7kH');

      print(response);

      return OlaAutoCompleteModel.fromJson(response.data);
      // return OlaAutoCompleteModel(
      //     errorMessage: response.data["error_message"],
      //     infoMessages: response.data["info_messages"],
      //     predictions: response.data["predictions"],
      //     status: response.data["status"]).fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}
