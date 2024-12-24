// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$idTokenAtom =
      Atom(name: '_AuthStoreBase.idToken', context: context);

  @override
  String? get idToken {
    _$idTokenAtom.reportRead();
    return super.idToken;
  }

  @override
  set idToken(String? value) {
    _$idTokenAtom.reportWrite(value, super.idToken, () {
      super.idToken = value;
    });
  }

  late final _$emailAtom = Atom(name: '_AuthStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void setIdToken(String? token) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setIdToken');
    try {
      return super.setIdToken(token);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String? mail) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setEmail');
    try {
      return super.setEmail(mail);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idToken: ${idToken},
email: ${email}
    ''';
  }
}
