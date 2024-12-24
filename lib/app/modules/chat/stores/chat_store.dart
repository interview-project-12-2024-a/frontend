import 'package:frontend/app/modules/shared/models/message.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  @observable
  ObservableList<Message> chat = ObservableList.of([]);

  @action
  void addMessage(Message message) {
    chat.add(message);
  }
}
