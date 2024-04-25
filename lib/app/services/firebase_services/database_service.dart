import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final firestore = FirebaseFirestore.instance;

  Future<bool> saveDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      final reference = await firestore.collection(collection).add(data);
      data['id'] = reference.id;
      await reference.update(data);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  /// Gurada un archivo con ID custom
  Future<bool> saveDocumentWithCustomId(
    Map<String, dynamic> object,
    String collection,
    String customId,
  ) async {
    try {
      final CollectionReference collRef = firestore.collection(collection);
      final DocumentReference docReferance = collRef.doc(customId);
      log(docReferance.id);
      object['id'] = customId;
      await firestore
          .collection(collection)
          .doc(docReferance.id)
          .set({...object});

      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  /// Retorna un documento dado su id y en que coleccion se encuentra
  Future<DocumentSnapshot> getDocument({
    required String documentId,
    required String collection,
  }) {
    return firestore.collection(collection).doc(documentId).get();
  }
}

final Database database = Database();
