import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:talentpitch/app/models/favorite.dart';
import 'package:talentpitch/app/widgets/custom_snackbars.dart';

class FavoritesController extends GetxController {
  final box = GetStorage();
  RxList<Favorite> favorites = <Favorite>[].obs;
  @override
  void onInit() {
    super.onInit();
 
    if (box.hasData('favorites')) {
      final List<dynamic> jsonFavorites = jsonDecode(box.read('favorites'));
      favorites.value = jsonFavorites
          .map((data) => Favorite.fromJson(data as Map<String, dynamic>))
          .toList();
    }
    print(favorites.length);
  }

  addFavorite({required String title, required String urlVideo}) {
    if (favorites.any((element) => element.url == urlVideo)) {
      CustomSnackBars.showErrorSnackBar(
          'El video ya se encuentra en favoritos');
      return;
    }
    favorites.add(
      Favorite(
        name: title,
        url: urlVideo,
      ),
    );
    box.remove('favorites');
    box.write(
      'favorites',
      jsonEncode(favorites),
    );
    CustomSnackBars.showSuccessSnackBar('Video agregado a favoritos con éxito');
  }
}
