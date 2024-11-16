part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class LoginWithGoogleEvent extends UserEvent{}
