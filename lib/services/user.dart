import 'package:travel_app/models/user.dart';

(User?, bool) getUser(UserCredentials userCreds) {
  print(userCreds.username);
  print(userCreds.password);
  if (userCreds.username == theOnlyTrueUser.username &&
      userCreds.password == theOnlyTrueUser.password) {
    return (theOnlyTrueUser, true);
  }
  return (null, false);
}
