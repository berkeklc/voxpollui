import 'dart:developer';

import 'package:voxpollui/product/initialize/models/category_model.dart';
import 'package:voxpollui/product/initialize/models/owner_model/user_model.dart';
import 'package:voxpollui/product/services/firebase/base_service.dart';

final class UserService extends BaseService {
  factory UserService() => _instance;
  UserService._();
  static final UserService _instance = UserService._();

  /// Get the user by [userId] as [String]
  /// Return [UserModel] if the user exists, otherwise return null
  Future<UserModel?> getUser(String userId) async {
    try {
      final response = await db
          .collection(FireStoreCollections.users.name)
          .doc(userId)
          .get();
      if (response.exists) {
        return UserModel.fromJson(response.data()!, response.id);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  /// Create a new user with [user] as [UserModel]
  /// Return true if the user is created successfully, otherwise return false
  Future<bool> createUser(UserModel user) async {
    try {
      final searchIndex =
          generateSearchIndex('${user.name} ${user.surname} ${user.userName}');
      final userMap = user.toMap();
      userMap[FireStoreFields.searchIndex.name] = searchIndex;
      await db
          .collection(FireStoreCollections.users.name)
          .doc(user.id)
          .set(userMap);
      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> updateUser(UserModel user) async {
    final searchIndex =
        generateSearchIndex('${user.name} ${user.surname} ${user.userName}');
    final userMap = user.toMap();
    userMap[FireStoreFields.searchIndex.name] = searchIndex;
    try {
      await db
          .collection(FireStoreCollections.users.name)
          .doc(user.id)
          .update(userMap);
      return true;
    } on Exception {
      return false;
    }
  }

  Future<List<String>> getFollowIds(String userId) async {
    try {
      final responseFollow = await db
          .collection(FireStoreCollections.users.name)
          .doc(userId)
          .collection(FireStoreCollections.following.name)
          .get();
      final responseCommunity = await db
          .collectionGroup(FireStoreCollections.members.name)
          .where('userId', isEqualTo: userId)
          .get();
      final idList = responseCommunity.docs
          .map((e) => e.reference.parent.parent?.id)
          .toList();
      final result = <String>[];
      for (final id in idList) {
        result.add(id ?? '');
      }
      for (final doc in responseFollow.docs) {
        result.add(doc.id);
      }
      return result;
    } on Exception {
      return [];
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response =
          await db.collection(FireStoreCollections.categories.name).get();
      return response.docs
          .map((e) => CategoryModel.fromMap(e.data(), e.id))
          .toList();
    } on Exception {
      return [];
    }
  }
}
