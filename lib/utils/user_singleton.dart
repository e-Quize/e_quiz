import 'package:e_quiz/models/user/user_entity_copy.dart';

class UserSingleton {

  UserEntityCopy userEntityCopy;

  UserSingleton._privateConstructor();


  static final UserSingleton instance = UserSingleton._privateConstructor();


  setUser(UserEntityCopy userEntityCopy)
  {
    this.userEntityCopy = userEntityCopy;
  }

}
