import 'package:flutter/cupertino.dart';
import 'package:getx_state_management/model/user_model.dart';

class UserController extends ChangeNotifier {
  final user = User();
  final editingController = TextEditingController();

  updateUser(String age) {
      user.userName = editingController.text;
      user.userAge = age;
      notifyListeners();
  }
}
