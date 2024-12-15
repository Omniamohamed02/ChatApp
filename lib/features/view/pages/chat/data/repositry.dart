
import 'package:chatapp/features/view/pages/chat/data/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Message>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Message.fromFirestore(doc.data());
      }).toList();
    });
  }

  Stream<List<Message>> getGroupMessages(String groupChatId) {
    return _firestore
        .collection('groups')
        .doc(groupChatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Message.fromFirestore(doc.data());
      }).toList();
    });
  }

  Future<void> sendMessage(String chatId, Message message) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toFirestore());
  }

  Future<void> sendGroupMessage(String groupChatId, Message message) async {
    await _firestore
        .collection('groups')
        .doc(groupChatId)
        .collection('messages')
        .add(message.toFirestore());
  }
}