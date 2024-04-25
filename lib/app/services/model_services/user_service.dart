import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talentpitch/app/utils/references.dart';

class UserService {
  factory UserService() {
    return _instance;
  }

  UserService._internal();
  static String usersReference = firebaseReferences.users;
  static final UserService _instance = UserService._internal();
  var firestore = FirebaseFirestore.instance;


  // Future<bool> save({
  //   required User user,
  //   required String customId,
  // }) async {
  //   try {
  //     user.created = DateTime.now();
  //     await database.saveDocumentWithCustomId(
  //       user.toJson(),
  //       usersReference,
  //       customId,
  //     );
  //     return true;
  //   } on Exception catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // Future<User?> getUserDocumentById(
  //   String documentId,
  // ) async {
  //   final querySnapshot = await database.getDocument(
  //     collection: 'users',
  //     documentId: documentId,
  //   );

  //   if (!querySnapshot.exists) return null;

  //   return User.fromJson(
  //     querySnapshot.data() as Map<String, dynamic>,
  //   );
  // }

  // Future<User?> getCurrentUser() async {
  //   final currentFirebaseUser = auth.getCurrentUser();
  //   print(currentFirebaseUser!.uid);
  //   final user = await getUserDocumentById(
  //     currentFirebaseUser.uid,
  //   );
  //   return user;
  // }

 
}

UserService userService = UserService();
