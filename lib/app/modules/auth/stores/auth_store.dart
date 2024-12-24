import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  String? idToken;
  @observable
  String? email;

  @action
  void setIdToken(String? token) {
    idToken = token;
  }

  @action
  void setEmail(String? mail) {
    email = mail;
  }
}
