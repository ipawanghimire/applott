import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/controller/api/api_requst.dart';
import 'package:lotteryapp/core/controller/api/gameplay/gameplay_notifier.dart';
import 'package:lotteryapp/core/model/login_model/login_model.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/helper/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService extends StateNotifier<AsyncValue<User?>> {
  LoginService() : super(const AsyncValue.loading());

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    // Replace with your login API URL
    const String loginEndPoint = '/api/auth/login';
    final body = {'email': email, 'password': password};
    final ApiRequest apiRequest = sl<ApiRequest>();
    final GamePlayNotifier gamePlayNotifier = sl<GamePlayNotifier>();

    try {
      state = const AsyncValue.loading();
      final response =
          await apiRequest.postHttp(baseUrl, body, loginEndPoint, '');

      if (response?.statusCode == 200) {
        await EasyLoading.showSuccess('Login Successful');

        String userName = response!.data['user']['name'].toString();
        String token = response!.data['tokens']['access']['token'].toString();
        String picture = response!.data['user']['photo'].toString();
        String email = response!.data['user']['email'].toString();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userName);
        await prefs.setString('token', token);
        await prefs.setString('picture', picture);
        await prefs.setString('email', email);

        final loginDetail =
            User.fromJson(response?.data as Map<String, dynamic>);
        state = AsyncValue.data(loginDetail);
        await gamePlayNotifier.fetchGameList();
        if (mounted) {
          context.go(mainScreen);
        }
      } else {
        throw Exception('Login failed');
      }
    } catch (error) {
      await EasyLoading.showError('Failed to Login. Please try again.');
    }
  }

  Future<void> signUp(
    String username,
    String email,
    String password,
    BuildContext context,
  ) async {
    // Replace with your login API URL
    const String registerEndPoint = '/api/auth/register';
    final body = {
      'name': username,
      'email': email,
      'password': password,
    };
    ApiRequest _apiRequest = sl<ApiRequest>();

    try {
      state = const AsyncValue.loading();
      final response =
          await _apiRequest.postHttp(baseUrl, body, registerEndPoint, '');

      if (response?.statusCode == 201) {
        await EasyLoading.showSuccess('Register Successful');
        final createdUser =
            User.fromJson(response?.data as Map<String, dynamic>);
        state = AsyncValue.data(createdUser);

        context.push(loginScreen);
      } else {
        throw Exception('Register failed');
      }
    } catch (error) {
      await EasyLoading.showError('Failed to Register. Please try again.');
    }
  }

  Future<void> ForgetPassword(
    String email,
    BuildContext context,
  ) async {
    // Replace with your login API URL
    const String forgetPwEndPoint = '/api/auth/forgot-password';
    final body = {
      'email': email,
    };
    final ApiRequest apiRequest = sl<ApiRequest>();

    try {
      state = const AsyncValue.loading();
      final response =
          await apiRequest.postHttp(baseUrl, body, forgetPwEndPoint, '');

      if (response?.statusCode == 204) {
        await EasyLoading.showSuccess('Password reset Successful');
        context.go('/');
      } else {
        throw Exception('Password reset failed');
      }
    } catch (error) {
      await EasyLoading.showError(
          'Failed to Reset Password. Please try again.');
    }
  }
}

final loginServiceProvider = Provider<LoginService>((ref) => LoginService());
