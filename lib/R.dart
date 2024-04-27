// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class messages {
  String message = "";
  bool me = true;
  messages({@required mess, required bool me}) {
    message = mess;
    this.me = me;
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Widget> chats = [];
  bool side = true;
  final TextEditingController _controller = TextEditingController();
  // final List<String> youmessages = [];
  // final List<String> memessages = [];
  List<messages> messages_list = [];

  void _addMessage(String text, bool mee) {
    setState(() {
      messages_list.add(messages(me: mee, mess: text));

      //  else {
      //   youmessages.add(text);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chatAPP'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
                // reverse: true,
                itemBuilder: (context, index) {
                  if (messages_list[index].me) {
                    print(messages_list[index].me);
                    return mee(messages_list[index].message);
                  }
                  return You(messages_list[index].message);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: messages_list.length),
          ),
          IconButton(
              onPressed: () {
                side = !side;
                // print(side);
              },
              icon: const Icon(Icons.change_circle)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                  // child: Text(''),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      print(side);
                      _addMessage(_controller.text, side);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget You(t) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
              )),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text(t)),
    );
  }

  Widget mee(t) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
              )),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text(t)),
    );
  }
}
