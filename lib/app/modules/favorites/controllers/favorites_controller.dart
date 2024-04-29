import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:talentpitch/app/models/favorite.dart';
import 'package:talentpitch/app/widgets/custom_snackbars.dart';

class FavoritesController extends GetxController {
  final box = GetStorage();
  final favorites = <Favorite>[].obs;
  @override
  void onInit() {
    super.onInit();
    initializeFavoritesList();
  }

  /// Inicializa la lista de favoritos desde Get storage
  initializeFavoritesList() {
    if (box.hasData('favorites')) {
      favorites.clear();
      final List<dynamic> jsonFavorites = jsonDecode(box.read('favorites'));
      favorites.value = jsonFavorites
          .map((data) => Favorite.fromJson(data as Map<String, dynamic>))
          .toList();
    }
  }

  /// Agrega un favorito al local storage
  addFavoriteToLocalStorage({required String title, required String urlVideo}) {
    if (hasDuplicatesFavorites(urlVideo)) return;
    addFavoriteToList(title, urlVideo);
    rewriteStorage();
    successAddFavorite();
  }

  /// Valida si el video ya ha sido agregado a favoritos
  hasDuplicatesFavorites(String urlVideo) {
    if (favorites.any((element) => element.url == urlVideo)) {
      CustomSnackBars.showErrorSnackBar(
          'El video ya se encuentra en favoritos');
      return true;
    }
    return false;
  }

  /// Agrega el video a la lista de favoritos
  addFavoriteToList(String title, String urlVideo) {
    favorites.add(
      Favorite(
        name: title,
        url: urlVideo,
      ),
    );
  }

  /// Reescribe el storage con la nueva lista de favoritos
  rewriteStorage() {
    box.remove('favorites');
    box.write(
      'favorites',
      jsonEncode(favorites),
    );
  }

  /// Muestra el snackbar de que el video fue agregado exitosamente
  successAddFavorite() {
    CustomSnackBars.showSuccessSnackBar('Video agregado a favoritos con éxito');
  }

  /// Muestra el snackbar de que el video fue eliminado exitosamente
  successDeleteFavorite() {
    CustomSnackBars.showSuccessSnackBar(
      'Video eliminado de favoritos con éxito',
    );
  }

  /// Elimina un favorito del local storage
  deleteFavorite(int index) {
    favorites.removeAt(index);
    rewriteStorage();
    successDeleteFavorite();
  }
}
