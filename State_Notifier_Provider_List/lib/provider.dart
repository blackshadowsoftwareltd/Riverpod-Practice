import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}

class UserNotifier extends ChangeNotifier {
  final users = <User>[];

  ///? add
  void add(User user) {
    users.add(user);
    notifyListeners();
  }

  ///? remove
  void remove(User user) {
    users.remove(user);
    notifyListeners();
  }

  ///? update
  void Update(int index, User newUser) {
    users[index] = newUser;
    notifyListeners();
  }

  ///? removeAll
  void clearAll() {
    users.clear();
    notifyListeners();
  }
}

final usersList = ChangeNotifierProvider<UserNotifier>((ref) => UserNotifier());
