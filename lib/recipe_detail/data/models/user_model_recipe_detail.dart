class UserModelInRecipeDetail {
  final int id;
  final String username, fullName;

  UserModelInRecipeDetail({
    required this.id,
    required this.username,
    required this.fullName,
  });

  factory UserModelInRecipeDetail.fromJson(Map<String, dynamic> json) {
    return UserModelInRecipeDetail(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
    );
  }
}
