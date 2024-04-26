import 'package:get/get.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/services/model_services/category_service.dart';

class HomeController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    categoryService.getCategories().then((value) => categories.value = value);
    print(categories.length);
  }
}
