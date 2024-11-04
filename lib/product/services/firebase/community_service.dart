import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voxpollui/product/initialize/models/category_model.dart';
import 'package:voxpollui/product/initialize/models/owner_model/community_model.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/services/firebase/base_service.dart';

final class CommunityService extends BaseService {
  factory CommunityService() => _instance;
  CommunityService._();
  static final CommunityService _instance = CommunityService._();

  ///Create Community
  Future<bool> createCommunity(CommunityModel community) async {
    try {
      final searchIndex =
          generateSearchIndex('${community.name} ${community.userName}');
      final communityMap = community.toMap();
      communityMap[FireStoreFields.searchIndex.name] = searchIndex;
      final response = await db
          .collection(FireStoreCollections.communities.name)
          .add(communityMap);
      await db
          .collection(FireStoreCollections.communities.name)
          .doc(response.id)
          .collection(FireStoreCollections.members.name)
          .add({
        'createdAt': Timestamp.now(),
        'userId': community.managerList?.first,
      });
      return true;
    } on Exception {
      return false;
    }
  }

  ///Update Community
  Future<bool> updateCommunity(CommunityModel community) async {
    final searchIndex =
        generateSearchIndex('${community.name} ${community.userName}');
    final communityMap = community.toMap();
    communityMap[FireStoreFields.searchIndex.name] = searchIndex;
    try {
      await db
          .collection(FireStoreCollections.communities.name)
          .doc(community.id)
          .update(communityMap);
      return true;
    } on Exception {
      return false;
    }
  }

  ///Join Community
  Future<bool> joinCommunity(String userId, String communityId) async {
    try {
      await db
          .collection(FireStoreCollections.communities.name)
          .doc(communityId)
          .collection(FireStoreCollections.members.name)
          .doc(userId)
          .set({
        'userId': userId,
        'createdAt': Timestamp.now(),
      });
      return true;
    } on Exception {
      return false;
    }
  }

  ///Leave Community
  Future<bool> leaveCommunity(String userId, String communityId) async {
    try {
      await db
          .collection(FireStoreCollections.communities.name)
          .doc(communityId)
          .collection(FireStoreCollections.members.name)
          .doc(userId)
          .delete();
      return true;
    } on Exception {
      return false;
    }
  }

  ///Check Membership
  Future<bool> checkMembership({
    required String userId,
    required String communityId,
  }) async {
    final response = await db
        .collection(FireStoreCollections.communities.name)
        .doc(communityId)
        .collection(FireStoreCollections.members.name)
        .doc(userId)
        .get();
    if (response.exists) return true;
    return false;
  }

  ///Get Members of a Community
  Future<List<String>> getCommunityMemberIds(String communityId) async {
    final response = await db
        .collection(FireStoreCollections.communities.name)
        .doc(communityId)
        .collection(FireStoreCollections.members.name)
        .get();
    final memberIds = response.docs.map((e) => e.id).toList();
    return memberIds;
  }

  ///Get Communities
  Future<List<CommunityModel>> getCommunities() async {
    final response = await db
        .collection(FireStoreCollections.communities.name)
        .where('recomended', isEqualTo: true)
        .limit(5)
        .get();
    final communityList = response.docs
        .map((e) => CommunityModel.fromJson(e.data(), e.id))
        .toList();
    return communityList;
  }

  ///Get Comminities which user is member of
  Future<List<CommunityModel>> getUserCommunities(String userId) async {
    final idListResponse = await db
        .collectionGroup(FireStoreCollections.members.name)
        .where('userId', isEqualTo: userId)
        .get();
    final idList =
        idListResponse.docs.map((e) => e.reference.parent.parent?.id).toList();
    final communityList = <CommunityModel>[];
    for (final id in idList) {
      final response = await db
          .collection(FireStoreCollections.communities.name)
          .doc(id)
          .get();
      if (!response.exists) continue;
      final community = CommunityModel.fromJson(response.data()!, response.id);
      communityList.add(community);
    }
    return communityList;
  }

  ///Get Categories
  Future<List<CategoryModel>> getCommunityCategories() async {
    final response =
        await db.collection(FireStoreCollections.categories.name).get();
    final categoryList = response.docs
        .map((e) => CategoryModel.fromMap(e.data(), e.id))
        .toList();
    return categoryList;
  }

  ///Get Polls of a Community
  Future<List<PollModel>> getCommunityPolls(String communityId) async {
    final response = await db
        .collection(FireStoreCollections.polls.name)
        .where(FireStoreFields.ownerId.name, isEqualTo: communityId)
        .get();
    final pollList =
        response.docs.map((e) => PollModel.fromJson(e.data(), e.id)).toList();
    return pollList;
  }

  ///Get Community by Id
  Future<CommunityModel?> getCommunity(String communityId) async {
    final response = await db
        .collection(FireStoreCollections.communities.name)
        .doc(communityId)
        .get();
    if (!response.exists) return null;
    final community = CommunityModel.fromJson(response.data()!, response.id);
    return community;
  }
}
