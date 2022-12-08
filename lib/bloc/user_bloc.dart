import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:getx_state_management/model/user_model.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';

part 'user_state.dart';

@Singleton()
class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc()
      : super(UserState(user: User(userName: "", userAge: 0))) {
    on<UserEvent>(_updateUser);
  }

  _updateUser(UserEvent event, Emitter<UserState> emit) async {
    emit(UserState(user: User(userName: event.userName, userAge: event.age)));
  }
}
