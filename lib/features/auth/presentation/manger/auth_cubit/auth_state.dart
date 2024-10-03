part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess({required this.user});
}

final class AuthFailuer extends AuthState {
  final String message;

  AuthFailuer({required this.message});
}

class AuthLoggedIn extends AuthState {}

class AuthLoggedOut extends AuthState {}
