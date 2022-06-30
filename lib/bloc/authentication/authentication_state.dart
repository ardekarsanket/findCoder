import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

//4 States: Uninitialized, Authenticated, AuthenticatedButNotSet, Unauthenticated

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String userId;

  //constructor
  Authenticated(this.userId);

  //props => The list of properties that will be used to determine whether two instances are equal.
  // In our case it is userId, so we are returning userId .... It is required for Equatable class
  @override
  List<Object> get props => [userId];

  @override
  String toString() => "Authenticated {userId}";
}

class AuthenticatedButNotSet extends AuthenticationState {
  final String userId;

  AuthenticatedButNotSet(this.userId);

  @override
  List<Object> get props => [userId];
}

class Unauthenticated extends AuthenticationState {}
