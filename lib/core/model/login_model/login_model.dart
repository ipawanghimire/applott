class User {
  User({
    this.email,
    this.id,
    this.name,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.photo,
    this.isEmailVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      photo: json['photo'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
    );
  }
  final String? id;
  final String? email;
  final String? name;
  final String? role;
  final String? createdAt;
  final String? updatedAt;
  final String? photo;
  final bool? isEmailVerified;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'photo': photo,
      'isEmailVerified': isEmailVerified,
    };
  }
}

class Permissions {
  Permissions({
    this.permissions,
  });

  factory Permissions.fromJson(List<dynamic> json) {
    return Permissions(
      permissions: json.cast<String>(),
    );
  }
  final List<String>? permissions;

  Map<String, dynamic> toJson() {
    return {
      'permissions': permissions,
    };
  }
}
