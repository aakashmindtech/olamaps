import 'package:get/get.dart';

import '../common/service_locator.dart';
import '../network/api/getx_repository.dart';

class AutoCompleteController extends GetxController {
  var isLoading = false.obs;
  static List autoCompleteItems = [];
  final repo = getIt.get<GetxRepository>();

  Future autoCompleteApiCall(context, value) async {
    try {
      isLoading.value = true;
      AutoCompleteController.autoCompleteItems.clear();
      final model =
      await repo.getOlaAutoComplete(value);
      isLoading.value = false;
      AutoCompleteController.autoCompleteItems.addAll(model.predictions);
      print(AutoCompleteController.autoCompleteItems);
    } catch (e) {
      print(e);
    }
  }
}