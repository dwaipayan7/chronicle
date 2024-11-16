class UserModel {
  final String id;
  final String name;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.photoUrl,
  });

  /// Factory constructor to create a `UserModel` from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
    );
  }

  /// Converts a `UserModel` instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}
