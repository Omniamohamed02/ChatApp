import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chatapp/features/view/pages/chat/cubit/chat.dart';
import 'package:chatapp/features/view/pages/chat/data/chat_model.dart';
import 'package:chatapp/features/view/pages/chat/data/repositry.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(ChatInitial());

  void loadMessages(String chatId) {
    try {
      emit(LoadMessagesLoading());
      _chatRepository.getMessages(chatId).listen(
            (messages) {
          if (messages.isNotEmpty) {
            emit(LoadMessagesSuccess(messages));
          } else {
            log('No messages found, start a conversation');
            emit(const LoadMessagesError(
                'No messages found, start a conversation'));
          }
        },
      );
    } catch (error) {
      log('error while loading messages: $error');
      emit(LoadMessagesError(error.toString()));
    }
  }

  void sendMessage(String chatId, String content, String sender) {
    if (content.isNotEmpty) {
      emit(SendMessageLoading());
      final message = Message(
        sender: sender,
        content: content,
        createdAt: DateTime.now(),
      );
      _chatRepository.sendMessage(chatId, message).catchError(
            (error) => emit(SendMessageError(error.toString())),
      );
    }
  }

  void loadGroupMessages(String groupId) {
    try {
      emit(LoadGroupMessagesLoading());
      _chatRepository.getGroupMessages(groupId).listen(
            (messages) {
          if (messages.isNotEmpty) {
            emit(LoadGroupMessagesSuccess(messages));
          } else {
            log('No messages found, start a group conversation');
            emit(const LoadGroupMessagesError(
                'No messages found, start a group conversation'));
          }
        },
      );
    } catch (error) {
      log('error while loading conversation messages: $error');
      emit(LoadGroupMessagesError(error.toString()));
    }
  }

  void sendGroupMessage(String groupId, String content, String sender) {
    if (content.isNotEmpty) {
      emit(SendMessageLoading());
      final message = Message(
        sender: sender,
        content: content,
        createdAt: DateTime.now(),
      );
      _chatRepository.sendGroupMessage(groupId, message).catchError(
            (error) => emit(SendMessageError(error.toString())),
      );
    }
  }

}