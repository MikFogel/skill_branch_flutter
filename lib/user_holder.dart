import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    print(user);

    if (!users.containsKey(user.login)) {
//      users.addAll({user.login : user});
      users[user.login] = user;
    } else {
      throw Exception("A user with this name already exist");
    }
  }

  User registerUserByEmail(String fullName, String email) {
    User user = User(name: fullName, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
      return user;
    } else {
      throw Exception('A user with this email already exists');
    }
  }

  User registerUserByPhone(String fullName, String phone) {
    User user = User(name: fullName, phone: phone);

    if (!users.containsKey(user.login)) {
    users[user.login] = user;
    return user;
    } else {
    throw Exception('A user with this phone already exists');
    }
  }

  User getUserByLogin(String login) {

    if (users.containsKey(login)) {
      return users[login];
    } else {
      return null;
    }
  }

  void setFriends(String login, List<User> userList) {
    User thisUser = getUserByLogin(login);
    thisUser.addFriends(userList);
  }

  User findUserInFriends(String login, User user) {
    User thisUser = getUserByLogin(login);

    if (thisUser.friends.contains(user)) {
      return user;
    } else {
      throw Exception('${user.login} is not a friend of the login');
    }

  }

  List<User> importUsers(List<String> userDump) {
    List<User> users = [];
    for (String dump in userDump) {
      User user = User(name: dump.split(";")[0].trim(),
      email: dump.split(";")[1].trim(),
      phone: dump.split(";")[2].trim());
      users.add(user);
    }
    return users;
  }

}