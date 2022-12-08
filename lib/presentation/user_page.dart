import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_state_management/bloc/count_bloc.dart';
import 'package:getx_state_management/bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);
  final UserBloc userBloc = GetIt.I<UserBloc>();
  final CountBloc countBloc = GetIt.I<CountBloc>();

  @override
  Widget build(BuildContext context) {
    final editingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              TextField(
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: 'Enter User Name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 40.0,
              ),
              StreamBuilder<UserState>(
                  stream: userBloc.stream,
                  builder: (context, snapShot) {
                    return Text(
                      'UserName: ${snapShot.data?.user?.userName}',
                      style: const TextStyle(fontSize: 22),
                    );
                  }),
              StreamBuilder<CountState>(
                  stream: countBloc.stream,
                  builder: (context, snapShot) {
                    return Text(
                      '${snapShot.data?.number.toString()}',
                      style: const TextStyle(fontSize: 38),
                    );
                  }),
              const SizedBox(
                height: 40.0,
              ),
              StreamBuilder<CountState>(
                  stream: countBloc.stream,
                  builder: (context, snapShot) {
                    return ElevatedButton(
                        onPressed: () {
                          userBloc.add(UserEvent(
                              age: snapShot.data?.number ?? 0,
                              userName: editingController.text));
                        },
                        child: const Text('Update UserName'));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
