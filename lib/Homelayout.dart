import 'package:flutter/material.dart';
import 'package:flutter_application_5/RequestStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_5/RequestsCubit.dart';

class homelayout extends StatelessWidget {
  const homelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestsCubit(),
      child: BlocConsumer<RequestsCubit, RequestStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(''),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: RequestsCubit.get(context).currentindex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.request_page)),
                BottomNavigationBarItem(icon: Icon(Icons.search)),
              ],
              onTap: (index) {
                RequestsCubit.get(context).change(index);
              },
            ),
            body: RequestsCubit.get(context)
                .Screens[RequestsCubit.get(context).currentindex],
          );
        },
      ),
    );
  }
}
