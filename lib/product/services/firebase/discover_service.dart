import 'package:voxpollui/product/initialize/models/owner_model/community_model.dart';
import 'package:voxpollui/product/initialize/models/owner_model/user_model.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/services/firebase/base_service.dart';

final class DiscoverService extends BaseService {
  factory DiscoverService() => _instance;
  DiscoverService._();
  static final DiscoverService _instance = DiscoverService._();

  Future<List<UserModel>> getUsers(String keyword) async {
    try {
      final response = await db
          .collection(FireStoreCollections.users.name)
          .where(
            FireStoreFields.searchIndex.name,
            arrayContainsAny: generateSearchIndex(keyword),
          )
          .limit(5)
          .get();

      return response.docs
          .map((e) => UserModel.fromJson(e.data(), e.id))
          .toList();
    } on Exception {
      return [];
    }
  }

  Future<List<CommunityModel>> getCommunities(String keyword) async {
    try {
      final response = await db
          .collection(FireStoreCollections.communities.name)
          .where(
            FireStoreFields.searchIndex.name,
            arrayContainsAny: generateSearchIndex(keyword),
          )
          .limit(5)
          .get();

      return response.docs
          .map((e) => CommunityModel.fromJson(e.data(), e.id))
          .toList();
    } on Exception {
      return [];
    }
  }

  Future<List<PollModel>> getPolls(String keyword) async {
    try {
      final response = await db
          .collection(FireStoreCollections.polls.name)
          .where(FireStoreFields.isPublic.name, isEqualTo: true)
          .where(
            FireStoreFields.searchIndex.name,
            arrayContainsAny: generateSearchIndex(keyword),
          )
          .limit(5)
          .get();
      return response.docs
          .map((e) => PollModel.fromJson(e.data(), e.id))
          .toList();
    } on Exception {
      return [];
    }
  }

  Future<List<PollModel>> getDiscoverPolls(List<String> interests) async {
    try {
      final response = await db
          .collection(FireStoreCollections.polls.name)
          .where(
            FireStoreFields.categoryId.name,
            whereIn: interests,
          )
          .orderBy(
            FireStoreFields.createdAt.name,
            descending: true,
          )
          .limit(8)
          .get();
      return response.docs
          .map((e) => PollModel.fromJson(e.data(), e.id))
          .toList();
    } on Exception {
      return [];
    }
  }
}
