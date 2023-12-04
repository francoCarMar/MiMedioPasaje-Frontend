import 'package:flutter/foundation.dart';
import 'package:mi_medio_pasaje/models/user_model.dart';

class UserNotifier extends ChangeNotifier {
  User _user = User(
      usrDNI: '',
      usrEma: '',
      usrNom: '',
      usrApe: '',
      usrPas: '',
      usrImgCar: '',
      usrImgDNI: '',
      usrValCod: 0,
      usrVal: false);

  UserNotifier();

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
