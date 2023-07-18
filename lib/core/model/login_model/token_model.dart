class Tokens {
  Tokens({
    this.access,
    this.refresh,
    this.expires,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
      expires: DateTime.parse(json['expires'] as String),
    );
  }
  final String? access;
  final String? refresh;
  final DateTime? expires;

  Map<String, dynamic> toJson() {
    return {
      'access': access,
      'refresh': refresh,
      'expires': expires?.toIso8601String(),
    };
  }
}
