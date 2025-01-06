// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStoreBase, Store {
  late final _$chatAtom = Atom(name: '_ChatStoreBase.chat', context: context);

  @override
  ObservableList<Message> get chat {
    _$chatAtom.reportRead();
    return super.chat;
  }

  @override
  set chat(ObservableList<Message> value) {
    _$chatAtom.reportWrite(value, super.chat, () {
      super.chat = value;
    });
  }

  late final _$chatListLoadingAtom =
      Atom(name: '_ChatStoreBase.chatListLoading', context: context);

  @override
  bool get chatListLoading {
    _$chatListLoadingAtom.reportRead();
    return super.chatListLoading;
  }

  @override
  set chatListLoading(bool value) {
    _$chatListLoadingAtom.reportWrite(value, super.chatListLoading, () {
      super.chatListLoading = value;
    });
  }

  late final _$haveMorePagesAtom =
      Atom(name: '_ChatStoreBase.haveMorePages', context: context);

  @override
  bool get haveMorePages {
    _$haveMorePagesAtom.reportRead();
    return super.haveMorePages;
  }

  @override
  set haveMorePages(bool value) {
    _$haveMorePagesAtom.reportWrite(value, super.haveMorePages, () {
      super.haveMorePages = value;
    });
  }

  late final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase', context: context);

  @override
  void setHaveMorePages(bool haveMore) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.setHaveMorePages');
    try {
      return super.setHaveMorePages(haveMore);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChatListLoading(bool isLoading) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.setChatListLoading');
    try {
      return super.setChatListLoading(isLoading);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessage(Message message) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.addMessage');
    try {
      return super.addMessage(message);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFront(Message message) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.addFront');
    try {
      return super.addFront(message);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chat: ${chat},
chatListLoading: ${chatListLoading},
haveMorePages: ${haveMorePages}
    ''';
  }
}
