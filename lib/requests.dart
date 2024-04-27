import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/R.dart';
import 'package:flutter_application_5/RequestStates.dart';
import 'package:flutter_application_5/RequestsCubit.dart';
import 'package:flutter_application_5/RequsetsModel.dart';
import 'package:flutter_application_5/RequsetsModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsScreen extends StatelessWidget {
  RequestsScreen({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RequestsCubit(),
      child: BlocConsumer<RequestsCubit, RequestStates>(
        listener: (context, state) {},
        builder: (context, state) {
          RequestsCubit cubb = RequestsCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text('My Requsets'),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BuildRequest(
                            context, cubb.requests[index], cubb, index);
                      },
                      itemCount: cubb.requests.length,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 60,
                  //   child: Icon(
                  //     Icons.request_quote,
                  //     size: 50,
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 2),
                  //   ),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // Call the function to show the bottom sheet using the key
                  //       scaffoldKey.currentState?.showBottomSheet(
                  //         (BuildContext context) {
                  //           return Container(
                  //             height: 500,
                  //             color: Colors.white,
                  //             child: SizedBox(
                  //               width: double.infinity,
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   IconButton(
                  //                       onPressed: () {
                  //                         print('wahba');
                  //                       },
                  //                       icon: const Icon(
                  //                         Icons.send,
                  //                         color: Colors.blue,
                  //                         size: 40,
                  //                       )),
                  //                   const SizedBox(
                  //                     height: 50,
                  //                   ),
                  //                   Padding(
                  //                     padding:
                  //                         const EdgeInsets.symmetric(horizontal: 10),
                  //                     child: Container(
                  //                       decoration: BoxDecoration(
                  //                         border: Border.all(width: 2),
                  //                       ),
                  //                       width: double.infinity,
                  //                       height: 300,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 20,
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 10.0),
                  //                     child: Container(
                  //                         decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10)),
                  //                         child: const Center(
                  //                             child: TextField(
                  //                           decoration: InputDecoration(
                  //                               hintText: 'description',
                  //                               border: OutlineInputBorder(
                  //                                   borderRadius: BorderRadius.all(
                  //                                       Radius.circular(10)))),
                  //                         ))),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     },
                  //     child: const Center(
                  //       child: Icon(
                  //         Icons.add,
                  //         color: Colors.blue,
                  //         size: 50,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context1) {
                    return Container(
                      height: 500,
                      color: Colors.white,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  cubb.addR();
                                  Navigator.pop(context1);
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.blue,
                                  size: 40,
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                ),
                                width: double.infinity,
                                height: 300,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Center(
                                  child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'description',
                                    border: OutlineInputBorder()),
                              )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Widget BuildRequest(context, Request request, RequestsCubit cubb, index) {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${request.senderId} ',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      '${request.request} ',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      cubb.delr(index);
                      print('object');
                    },
                    icon: const Icon(Icons.delete)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
