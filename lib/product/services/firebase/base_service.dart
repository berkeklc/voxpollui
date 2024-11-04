import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class BaseService {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
}

List<String> generateSearchIndex(String data) {
  final keywords = <String>[];

  final texts = data.toLowerCase().split(' ');
  for (final text in texts) {
    for (var i = 0; i < text.length; i++) {
      for (var j = i + 3; j <= text.length; j++) {
        keywords.add(text.substring(i, j));
      }
    }
  }

  return keywords;
}

enum FireStoreCollections {
  //Top Level Collections
  users,
  polls,
  categories,
  communities,
  //Sub Collections
  votes,
  followers,
  following,
  members,
}

enum FireStoreFields {
  none,
  ownerId,
  searchIndex,
  createdAt,
  categoryId,
  isPublic
}
