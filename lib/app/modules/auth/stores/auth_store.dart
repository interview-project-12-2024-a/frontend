import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  String? idToken;

  @action
  void setIdToken(String? token) {
    idToken = token;
  }

  @computed
  String? get jwt => idToken;
}
