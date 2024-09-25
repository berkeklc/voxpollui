import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:voxpollui/product/initialize/models/poll/option_model.dart';

final class PollModel extends Equatable {
  const PollModel({
    required this.id,
    required this.ownerId,
    this.title,
    this.description,
    this.imageUrl,
    this.createdAt,
    this.endAt,
    this.options,
  });

  factory PollModel.fromQDS(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return PollModel(
      id: snapshot.id,
      ownerId: data['ownerId'] as String,
      title: data['title'] as String?,
      description: data['description'] as String?,
      imageUrl: data['imageUrl'] as String?,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      endAt: (data['endAt'] as Timestamp?)?.toDate(),
      options: (data['options'] as List<dynamic>?)
          ?.map((e) => OptionModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory PollModel.fromDS(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return PollModel(
      id: snapshot.id,
      ownerId: data['ownerId'] as String,
      title: data['title'] as String?,
      description: data['description'] as String?,
      imageUrl: data['imageUrl'] as String?,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      endAt: (data['endAt'] as Timestamp?)?.toDate(),
      options: (data['options'] as List<dynamic>?)
          ?.map((e) => OptionModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ownerId': ownerId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'endAt': endAt != null ? Timestamp.fromDate(endAt!) : null,
      'options': options?.map((e) => e.toMap()).toList(),
    };
  }

  final String id;
  final String ownerId;
  final String? title;
  final String? description;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? endAt;
  final List<OptionModel>? options;

  @override
  List<Object?> get props => [
        id,
        ownerId,
        title,
        description,
        imageUrl,
        createdAt,
        endAt,
        options,
      ];
}