class Users {
  final int? user_id;
  final String username;
  final String password;
  Users({this.user_id, required this.username, required this.password});

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    user_id: json['user_id'],
    username: json['username'],
    password: json['password'],
  );

  Map<String, dynamic> toMap() => {
    'user_id': user_id,
    'username': username,
    'password': password,
  };
}