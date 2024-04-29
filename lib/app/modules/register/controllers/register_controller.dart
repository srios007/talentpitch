import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talentpitch/app/models/user.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/services.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class RegisterController extends GetxController {
  final confPassController = TextEditingController();
  final emailController = TextEditingController();
  final lastnameController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final key = GlobalKey<FormState>();

  final isLoading = false.obs;
  final isLoadingPP = false.obs;
  final showConfPass = false.obs;
  final showPass = false.obs;
  final terms = false.obs;

  late var _signUpResult;

  File? profilePicture;

  final _picker = ImagePicker();

  final _user = User();

  /// Muestra u oculta la contraseña
  showPassword() {
    showPass.value = !showPass.value;
  }

  /// Muestra u oculta el confirmar contraseña
  showConfPassword() {
    showConfPass.value = !showConfPass.value;
  }

  /// Cambia el estado del checkbox de términos y condiciones
  onChangedTermsSelectValue() {
    terms.value = !terms.value;
  }

  /// Va a la pantalla de términos y condiciones
  goToTerms() {
    print('LLeva a términos y condiciones');
  }

  /// Va a la pantalla de políticas de privacidad
  goToPolicies() {
    print('LLeva a políticas de privacidad');
  }

  /// Subir foto de perfil
  pickPicture(bool isCamera) async {
    if (await Permission.mediaLibrary.request().isGranted &&
        await Permission.camera.request().isGranted) {
      isLoadingPP.value = true;
      try {
        final result = await _picker.pickImage(
            source: isCamera ? ImageSource.camera : ImageSource.gallery);
        Get.back();

        if (result != null) {
          profilePicture = null;
          profilePicture = File(result.path);
          isLoadingPP.value = false;
        } else {
          isLoadingPP.value = false;
        }
      } catch (e) {
        CustomSnackBars.showErrorSnackBar(
          'Hubo un error al cargar tu foto de perfil',
        );
        isLoadingPP.value = false;
      }
    } else {
      CustomSnackBars.showErrorSnackBar(
        'Por favor, activa los permisos desde la configuración de tu celular '
        'para poder acceder a los archivos que necesites y tomar fotos',
      );
      isLoadingPP.value = false;
    }
  }

  /// Asignar usuario al modelo
  _assignUser(String profilePicture) {
 
    _user.name = nameController.text;
    _user.lastname = lastnameController.text;
    _user.email = emailController.text;
    _user.profilePictureUrl = profilePicture;
  }

  /// Registrar en firebase auth
  _signUp() async {
    _signUpResult = await auth.signUp(
      email: emailController.text,
      password: passController.text,
    );
  }

  /// Valida la respuesta de frebase auth
  _validateAndSignUp() async {
    switch (_signUpResult) {
      case 'There is an account already registered with this email.':
        CustomSnackBars.showErrorSnackBar(
            'Ya existe un usuario con este correo.');
        isLoading.value = false;
        break;
      case 'Your email address appears to be malformed.':
        CustomSnackBars.showErrorSnackBar('Tu correo está mal escrito');
        break;
    }
    if (_signUpResult is String) {
      CustomSnackBars.showErrorSnackBar(_signUpResult);
      isLoading.value = false;
      return;
    }
  }

  /// Valida si tiene o no foto para subirla
  _validateProfilePicture() async {
    if (profilePicture != null) {
      final urlRutResult = await storageService.uploadFile(
        _signUpResult.user.uid,
        'FotoPerfil',
        profilePicture!,
      );
      _assignUser(urlRutResult!);
    } else {
      _assignUser('');
    }
  }

  /// Guarda el usuario en firebase
  _saveUserInFirebase() async {
    final result = await userService.save(
      user: _user,
      customId: _signUpResult.user.uid,
    );
    if (result) {
      Get.offAllNamed(Routes.TABS);
    } else {
      CustomSnackBars.showErrorSnackBar(
        'Error al crear el usuario, por favor intenta de nuevo',
      );
    }
  }

  /// Registra al usuario
  registerUser() async {
    if (_validateTerms() && key.currentState!.validate()) {
      try {
        isLoading.value = true;
        await _signUp();
        await _validateAndSignUp();
        await _validateProfilePicture();
        await _saveUserInFirebase();

        isLoading.value = false;
      } catch (e) {
        await auth.deleteUser();
        CustomSnackBars.showErrorSnackBar(
          'Error al crear el usuario, por favor intenta de nuevo',
        );
        isLoading.value = false;
      }
    }
  }

  /// Valida los términos y condiciones
  _validateTerms() {
    if (!terms.value) {
      CustomSnackBars.showErrorSnackBar(
        'Por favor, acepta los términos y condiciones y políticas de privacidad',
      );
      return false;
    }
    return true;
  }
}
