import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/login_model.dart';
import '../login_api_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      final result = await LoginApiService().login(email, password);
      final user = UserModel.fromJson(result);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userToken', user.token);

      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(message: 'Login failed: wrong email or password!'));
    }
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('userToken');

    if (token != null) {
      emit(AuthLoggedIn());
    } else {
      emit(AuthLoggedOut());
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
    emit(AuthLoggedOut());
  }
}
