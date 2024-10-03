import 'package:bloc/bloc.dart';
import 'package:ibm_task/core/network/cache.dart';
import 'package:meta/meta.dart';

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

      await Cache.insertToCache(key: 'token', value: user.token);

      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailuer(message: 'Login failed: wrong email or password!'));
    }
  }

  Future<void> logout() async {
    await Cache.deleteCacheItem(key: 'token');

    emit(AuthLoggedOut());
  }
}
