class Users {
  final String username;
  final String email;
  final String password;
  final String profileImage;
  bool isOnline;
 

  Users({
    this.isOnline = false,
    required this.username,
    required this.email,
    required this.password,
    required this.profileImage,
  });
}
