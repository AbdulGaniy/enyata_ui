class BasicUserDisplayData {
  final String dpUrl;
  final String displayName;
  final String username;
  final bool isVerified;
  final String coverPhoto;
  final bool isCreator;

  const BasicUserDisplayData({
    required this.dpUrl,
    required this.displayName,
    required this.username,
    required this.isVerified,
    required this.coverPhoto,
    this.isCreator = false,
  });

  BasicUserDisplayData copyWith({
    String? dpUrl,
    String? displayName,
    String? username,
    bool? isVerified,
    String? coverPhoto,
    bool? isCreator,
  }) {
    return BasicUserDisplayData(
      dpUrl: dpUrl ?? this.dpUrl,
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      isVerified: isVerified ?? this.isVerified,
      coverPhoto: coverPhoto ?? this.coverPhoto,
      isCreator: isCreator ?? this.isCreator,
    );
  }

  bool get hasDp => dpUrl.isNotEmpty;

  bool get hasCoverPhoto => coverPhoto.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {
      'dpUrl': dpUrl,
      'displayName': displayName,
      'username': username,
      'isVerified': isVerified,
      'header': coverPhoto,
      'isCreator': isCreator,
    };
  }

  BasicUserDisplayData toBasicUser() {
    return BasicUserDisplayData(
      displayName: displayName,
      username: username,
      dpUrl: dpUrl,
      isVerified: isVerified,
      coverPhoto: coverPhoto,
      isCreator: isCreator,
    );
  }

  factory BasicUserDisplayData.fromJson(Map<String, dynamic> json) {
    return BasicUserDisplayData(
      dpUrl: json['dpUrl'],
      displayName: json['displayName'],
      username: json['username'],
      isVerified: json['isVerified'],
      coverPhoto: json['header'],
      isCreator: json['isCreator'] ?? false,
    );
  }
}
