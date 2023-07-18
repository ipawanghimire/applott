import 'package:lotteryapp/core/model/login_model/login_model.dart';
import 'package:lotteryapp/core/model/login_model/token_model.dart';

class UserWithTokensAndPermissions {
  UserWithTokensAndPermissions({
    this.user,
    this.tokens,
    this.permissions,
  });

  factory UserWithTokensAndPermissions.fromJson(Map<String, dynamic> json) {
    return UserWithTokensAndPermissions(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      tokens: Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      permissions: Permissions.fromJson(json['permissions'] as List),
    );
  }
  final User? user;
  final Tokens? tokens;
  final Permissions? permissions;

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'tokens': tokens?.toJson(),
      'permissions': permissions?.toJson(),
    };
  }
}
