import 'package:frontend/app/modules/shared/models/message.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  @observable
  ObservableList<Message> chat = ObservableList.of([]);
  @observable
  bool chatListLoading = false;
  @observable
  bool haveMorePages = true;

  @action
  void setHaveMorePages(bool haveMore) {
    haveMorePages = haveMore;
  }

  @action
  void setChatListLoading(bool isLoading) {
    chatListLoading = isLoading;
  }

  @action
  void addMessage(Message message) {
    chat.add(message);
  }

  @action addFront(Message message) {
    chat.insert(0, message);
  }
}
