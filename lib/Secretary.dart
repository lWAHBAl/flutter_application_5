import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/R.dart';

class Secretary extends StatelessWidget {
  const Secretary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secretary Screen')),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return BuildRequest(context);
        },
        itemCount: 10,
      ),
    );
  }

  Widget BuildRequest(context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(width: 0.1))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mahmoud Ahmed Wahba',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      'my request is being written here ',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.check))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
