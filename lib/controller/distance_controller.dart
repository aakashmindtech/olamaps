import 'package:get/get.dart';

import '../common/service_locator.dart';
import '../network/api/getx_repository.dart';

class DistanceController extends GetxController {
  var isLoading = false.obs;
  static List distanceListItems = [];
  final repo = getIt.get<GetxRepository>();

  Future distanceApiCall(context, sourceLat, sourceLong, destLat, destLong) async {
    try {
      isLoading.value = true;
      DistanceController.distanceListItems.clear();
      final model =
      await repo.getDistanceItems(sourceLat, sourceLong, destLat, destLong);
      isLoading.value = false;
      DistanceController.distanceListItems.addAll(model.predictions);
      print(DistanceController.distanceListItems);
    } catch (e) {
      print(e);
    }
  }
}