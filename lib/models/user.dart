import 'package:travel_app/utils/uuid.dart';


class UserCredentials {
  final String username;
  final String password;

  UserCredentials({
    required this.username,
    required this.password,
  });
}

class User {
  late final String id;
  final String username;
  final String password;

  final String? firstName;
  final String? lastName;

  User({
    String? id,
    required this.username,
    required this.password,
    this.firstName,
    this.lastName,
  }) : id = id ?? uuid.v4();

  User copyWith({
    String? id,
    String? username,
    String? password,
    String? firstName,
    String? lastName,
  }) {
    return User(
      id: id ?? this.id,
      username: username?? this.username,
      password: password?? this.password,
      firstName: firstName?? this.firstName,
      lastName: lastName?? this.lastName,
    );
  }
}


final theOnlyTrueUser = User(username: "unabomber", password: "abyr12345@");