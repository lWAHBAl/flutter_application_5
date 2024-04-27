import 'package:flutter/material.dart';
import 'package:flutter_application_5/RequsetsModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_5/RequestStates.dart';
import 'package:flutter_application_5/requests.dart';
import 'package:flutter_application_5/Secretary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestsCubit extends Cubit<RequestStates> {
  RequestsCubit() : super(initState());

  List<Widget> Screens = [RequestsScreen(), const Secretary()];
  List<Request> requests = [
    Request(senderId: 22010237, receiverId: 22010289, request: ['Request1']),
    Request(senderId: 22010237, receiverId: 22010289, request: ['Request2']),
    Request(senderId: 22010237, receiverId: 22010289, request: ['Request3'])
  ];

  static RequestsCubit get(context) => BlocProvider.of(context);
  // final CollectionReference _requestCollection =
  //     FirebaseFirestore.instance.collection('requests');

  int currentindex = 0;
  void change(index) {
    currentindex = index;
    emit(BottomNavBarState());
  }

  // Future<void> addRequest(Request request) async {
  //   await _requestCollection.add(request.toJson());
  // }

// Stream<List<Map<String, dynamic>>> getRequests() {
//   return _requestCollection.snapshots().map((snapshot) =>
//       snapshot.docs.map((doc) => doc.data()).toList());
// }

  // Future<void> deleteRequest(String requestId) async {
  //   await _requestCollection.doc(requestId).delete();
  // }

  void add() {
    requests.add(Request(
        senderId: 22010237, receiverId: 22010289, request: ['Request1']));
    requests.add(Request(
        senderId: 22010237, receiverId: 22010289, request: ['Request2']));
    requests.add(Request(
        senderId: 22010237, receiverId: 22010289, request: ['Request3']));
  }

  void addR() {
    requests.add(
        Request(senderId: 22010237, receiverId: 22010289, request: ['Wahba']));
    emit(state());
  }

  void delr(index) {
    requests.removeAt(index);
    emit(state());
  }
}
