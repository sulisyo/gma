part of 'user_bloc.dart';

class UserEvent {
  const UserEvent({required this.age, this.userName = ""});

  final int age;
  final String userName;
}