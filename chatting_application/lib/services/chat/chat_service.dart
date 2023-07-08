import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../model/message.dart';

class ChatService extends ChangeNotifier {
  // get the instance of the auth and the firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SEND MESSAGES
  Future<void> sendMessage(String reciverId, String message) async {
    // get the currewnt user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        reciverId: reciverId,
        timestamp: timestamp,
        message: message);

    // construct a chat room if from current user id and reciver id (stroed to ensure uniqueness)
    List<String> ids = [currentUserId, reciverId];
    ids.sort(); // sort the ids (this ensures the chat room id is always the same for any pair of two people.)
    String chatRoomId = ids.join(
        "_"); // combine the ids into a single string to use as a chatroomID

    // add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // GET MESSAGES
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // construct a chat room if from current user id and reciver id (stroed to ensure uniqueness)
    List<String> ids = [userId, otherUserId];
    ids.sort(); // sort the ids (this ensures the chat room id is always the same for any pair of two people.)
    String chatRoomId = ids.join("_");

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
