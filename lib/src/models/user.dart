// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'models.dart';

class User {
  final String id;
  final String updatedAt;
  final String username;
  final String name;
  final ProfileImage profileImage;
  final Links links;
  final int totalCollections;
  final int totalLikes;
  final int totalPhotos;
  final bool acceptedTos;
  final Social? social;
  final String? firstName;
  final String? lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final String? instagramUsername;
  final bool? forHire;
  final bool? followedByUser;
  final List<Photo>? photos;
  final List<Tag> tags;
  final int? followersCount;
  final int? followingCount;
  final bool? allowMessages;
  final int? numericId;
  final int? downloads;
  final Meta? meta;
  const User(
      {required this.id,
      required this.updatedAt,
      required this.username,
      required this.name,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.location,
      required this.links,
      required this.profileImage,
      this.instagramUsername,
      required this.totalCollections,
      required this.totalLikes,
      required this.totalPhotos,
      required this.acceptedTos,
      this.forHire,
       this.social,
      this.followedByUser,
      this.photos,
      required this.tags,
      this.followersCount,
      this.followingCount,
      this.allowMessages,
      this.numericId,
      this.downloads,
      this.meta});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updated_at': updatedAt,
      'username': username,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'twitter_username': twitterUsername,
      'portfolio_url': portfolioUrl,
      'bio': bio,
      'location': location,
      'links': links.toMap(),
      'profile_image': profileImage.toMap(),
      'instagram_username': instagramUsername,
      'total_collections': totalCollections,
      'total_likes': totalLikes,
      'total_photos': totalPhotos,
      'accepted_tos': acceptedTos,
      'for_hire': forHire,
      'social': social?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      updatedAt: json['updated_at'],
      username: json['username'],
      name: json['name'],
      profileImage: ProfileImage.fromMap(json['profile_image']),
      links: Links.fromMap(json['links']),
      totalCollections: json['total_collections'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      acceptedTos: json['accepted_tos'],
      social: json['social'] != null ? Social.fromMap(json['social']) : null,
      firstName: json['first_name'],
      lastName: json['last_name'],
      twitterUsername: json['twitter_username'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      instagramUsername: json['instagram_username'],
      forHire: json['for_hire'],
      followedByUser: json['followed_by_user'],
      photos: json['photos'] != null
          ? (json['photos'] as List)
              .map((photo) => Photo.fromMap(photo))
              .toList()
          : [],
      tags: json['tags'] != null
          ? (json['tags'] as List).map((photo) => Tag.fromMap(photo)).toList()
          : [],
      followersCount: json['followers_count'],
      followingCount: json['following_count'],
      allowMessages: json['allow_messages'],
      numericId: json['numeric_id'],
      downloads: json['downloads'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, updatedAt: $updatedAt, username: $username, name: $name, firstName: $firstName, lastName: $lastName, twitterUsername: $twitterUsername, portfolioUrl: $portfolioUrl, bio: $bio, location: $location, links: $links, profileImage: $profileImage, instagramUsername: $instagramUsername, totalCollections: $totalCollections, totalLikes: $totalLikes, totalPhotos: $totalPhotos, acceptedTos: $acceptedTos, forHire: $forHire, social: $social)';
  }

  User copyWith({
    String? id,
    String? updatedAt,
    String? username,
    String? name,
    ProfileImage? profileImage,
    Links? links,
    int? totalCollections,
    int? totalLikes,
    int? totalPhotos,
    bool? acceptedTos,
    Social? social,
    String? firstName,
    String? lastName,
    String? twitterUsername,
    String? portfolioUrl,
    String? bio,
    String? location,
    String? instagramUsername,
    bool? forHire,
    bool? followedByUser,
    List<Photo>? photos,
    List<Tag>? tags,
    int? followersCount,
    int? followingCount,
    bool? allowMessages,
    int? numericId,
    int? downloads,
    Meta? meta,
  }) {
    return User(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      links: links ?? this.links,
      totalCollections: totalCollections ?? this.totalCollections,
      totalLikes: totalLikes ?? this.totalLikes,
      totalPhotos: totalPhotos ?? this.totalPhotos,
      acceptedTos: acceptedTos ?? this.acceptedTos,
      social: social ?? this.social,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      portfolioUrl: portfolioUrl ?? this.portfolioUrl,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      instagramUsername: instagramUsername ?? this.instagramUsername,
      forHire: forHire ?? this.forHire,
      followedByUser: followedByUser ?? this.followedByUser,
      photos: photos ?? this.photos,
      tags: tags ?? this.tags,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      allowMessages: allowMessages ?? this.allowMessages,
      numericId: numericId ?? this.numericId,
      downloads: downloads ?? this.downloads,
      meta: meta ?? this.meta,
    );
  }
}





  // factory User.fromMap(Map<String, dynamic> map) {
  //   return User(
  //     map['id'] as String,
  //     map['updatedAt'] as String,
  //     map['username'] as String,
  //     map['name'] as String,
  //     ProfileImage.fromMap(map['profileImage'] as Map<String,dynamic>),
  //     Links.fromMap(map['links'] as Map<String,dynamic>),
  //     map['totalCollections'] as int,
  //     map['totalLikes'] as int,
  //     map['totalPhotos'] as int,
  //     map['acceptedTos'] as bool,
  //     Social.fromMap(map['social'] as Map<String,dynamic>),
  //     map['firstName'] != null ? map['firstName'] as String : null,
  //     map['lastName'] != null ? map['lastName'] as String : null,
  //     map['twitterUsername'] != null ? map['twitterUsername'] as String : null,
  //     map['portfolioUrl'] != null ? map['portfolioUrl'] as String : null,
  //     map['bio'] != null ? map['bio'] as String : null,
  //     map['location'] != null ? map['location'] as String : null,
  //     map['instagramUsername'] != null ? map['instagramUsername'] as String : null,
  //     map['forHire'] != null ? map['forHire'] as bool : null,
  //     map['followedByUser'] != null ? map['followedByUser'] as bool : null,
  //     map['photos'] != null ? List<Photo>.from((map['photos'] as List<int>).map<Photo?>((x) => Photo.fromMap(x as Map<String,dynamic>),),) : null,
  //     map['tags'] != null ? Tag.fromMap(map['tags'] as Map<String,dynamic>) : null,
  //     map['followersCount'] != null ? map['followersCount'] as int : null,
  //     map['followingCount'] != null ? map['followingCount'] as int : null,
  //     map['allowMessages'] != null ? map['allowMessages'] as bool : null,
  //     map['numericId'] != null ? map['numericId'] as int : null,
  //     map['downloads'] != null ? map['downloads'] as int : null,
  //     map['meta'] != null ? Meta.fromMap(map['meta'] as Map<String,dynamic>) : null,
  //   );
  // }