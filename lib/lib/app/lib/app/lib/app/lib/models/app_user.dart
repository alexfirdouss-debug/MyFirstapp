class AppUser {
  final String id;
  final String email;
  final String displayName;
  final String photoUrl;
  final DateTime createdAt;

  AppUser({
    required this.id,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.createdAt,
  });

  factory AppUser.fromMap(Map<String, dynamic> data) {
    return AppUser(
      id: data['id'],
      email: data['email'],
      displayName: data['displayName'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      createdAt: data['createdAt']?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
    };
  }
}
